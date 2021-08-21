//
//  WorkoutManager.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import Foundation
import HealthKit
import Combine


class WorkoutManager: NSObject, ObservableObject {
    
    let phone = PhoneInterface()
    
    let healthStore = HKHealthStore()
    var workoutSession: HKWorkoutSession!
    var workoutBuilder: HKLiveWorkoutBuilder!
    
    var running: Bool = false
    var start: Date = Date()
    var end: Date = Date()
    var cancellable: Cancellable?
    var accumulatedTime: Int = 0
    
    @Published var heartrate: Double = 0
    @Published var activeCalories: Double = 0
    @Published var distance: Double = 0
    @Published var pace: Double = 0
    @Published var elapsedSeconds: Int = 0
    @Published var workoutSummary: [String: Any] = [:]
    
    func requestAuthorization() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
        }
    }
    
    func workoutConfiguration() -> HKWorkoutConfiguration {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .running
        configuration.locationType = .outdoor
        
        return configuration
    }
    
    func setUpTimer() {
        start = Date()
        cancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.elapsedSeconds = self.incrementElapsedTime()
            }
    }
    
    func incrementElapsedTime() -> Int {
        let runningTime: Int = Int(-1 * (self.start.timeIntervalSinceNow))
        return self.accumulatedTime + runningTime
    }
    
    func sendData(status: String){
        phone.sendAll(workoutStatus: status, timestamp: self.elapsedSeconds, heartrate: self.heartrate, distance: self.distance, calories: self.activeCalories, pace: self.pace, start: self.start, end: self.end)
    }
    
    func startWorkout() {
        setUpTimer()
        self.running = true
        self.sendData(status: "Running")
        
        do {
            workoutSession = try HKWorkoutSession(healthStore: healthStore, configuration: self.workoutConfiguration())
            workoutBuilder = workoutSession.associatedWorkoutBuilder()
        } catch {
            return
        }
        
        workoutSession.delegate = self
        workoutBuilder.delegate = self
        
        workoutBuilder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                     workoutConfiguration: workoutConfiguration())
        
        workoutSession.startActivity(with: Date())
        workoutBuilder.beginCollection(withStart: Date()) { (success, error) in
        }
        
    }
    
    func togglePause() {
        if running == true {
            self.pauseWorkout()
        } else {
            resumeWorkout()
        }
    }

    func pauseWorkout() {
        workoutSession.pause()
        cancellable?.cancel()
        accumulatedTime = elapsedSeconds
        running = false
        self.sendData(status: "Pause")
        
    }

    func resumeWorkout() {
        workoutSession.resume()
        setUpTimer()
        running = true
        self.sendData(status: "Running")
    }

    func endWorkout() {
        workoutSession.end()
        cancellable?.cancel()
        end = Date()
        self.sendData(status: "Ended")
    }

    func resetWorkout() {
        DispatchQueue.main.async {
            self.elapsedSeconds = 0
            self.activeCalories = 0
            self.heartrate = 0
            self.distance = 0
            self.running = false
        }
    }
    
    func createSummary() {
        workoutSummary = [ "Total Time": elapsedSeconds, "Total Distance": distance, "Calories Burned": activeCalories, "Pace": pace ]
    }
    
    func updateForStatistics(_ statistics: HKStatistics?) {
        guard let statistics = statistics else { return }
        
        DispatchQueue.main.async {
            switch statistics.quantityType {
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                let value = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit)
                let roundedValue = Double( round( 1 * value! ) / 1 )
                self.heartrate = roundedValue
                self.sendData(status: "Running")
            case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                let energyUnit = HKUnit.kilocalorie()
                let value = statistics.sumQuantity()?.doubleValue(for: energyUnit)
                self.activeCalories = Double( round( 1 * value! ) / 1 )
                self.sendData(status: "Running")
                return
            case HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning):
                let meterUnit = HKUnit.meter()
                let value = statistics.sumQuantity()?.doubleValue(for: meterUnit)
                let roundedValue = Double( round( 1 * value! ) / 1 )
                self.distance = roundedValue
                self.pace = Double( self.elapsedSeconds * 60 ) / roundedValue
                self.sendData(status: "Running")
                return
            default:
                self.sendData(status: "Running")
                return
            }
        }
    }
}




extension WorkoutManager: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState,
                        from fromState: HKWorkoutSessionState, date: Date) {
        
        if toState == .ended {
            workoutBuilder.endCollection(withEnd: Date()) { (success, error) in
                self.workoutBuilder.finishWorkout { (workout, error) in
                    self.createSummary()
                    self.resetWorkout()
                }
            }
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        
    }
}

extension WorkoutManager: HKLiveWorkoutBuilderDelegate {
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        
    }
    
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else {
                return // Nothing to do.
            }
            
            /// - Tag: GetStatistics
            let statistics = workoutBuilder.statistics(for: quantityType)
            
            // Update the published values.
            updateForStatistics(statistics)
        }
    }
}
