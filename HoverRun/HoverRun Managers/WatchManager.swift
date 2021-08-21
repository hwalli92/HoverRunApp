//
//  WatchManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    
    var dataContainer = DataManager.dataManager
    
    var workoutStart: Date = Date()
    var workoutEnd: Date = Date()
    var timestamp: [Int] = [0]
    
    @Published var enable = true
    @Published var workoutStatus: String = "Not Running"
    @Published var heartrate: [Double] = [0]
    @Published var distance: [Double] = [0]
    @Published var activeCalories: [Double] = [0]
    @Published var currentPace: [Double] = [0]
    @Published var reachable: Bool = false
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        self.checkReachable()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.workoutStatus = message["status"] as? String ?? "Not Running"
            self.timestamp.append(message["timestamp"] as? Int ?? 0)
            self.heartrate.append(message["heartrate"] as? Double ?? 0)
            self.activeCalories.append(message["activeCalories"] as? Double ?? 0)
            self.distance.append(message["distance"] as? Double ?? 0)
            self.currentPace.append(message["pace"] as? Double ?? 0)
            self.workoutStart = message["start"] as? Date ?? Date()
            self.workoutEnd = message["end"] as? Date ?? Date()
        }
        
        if (message["status"] as! String == "Ended"){
            saveWorkout()
            resetWorkout()
        }
    }
    
    func sendMessage(workoutStatus: String){
        self.session.sendMessage(["status": workoutStatus], replyHandler: nil){ (error) in
            print("Error sending message: \(error)")
        }
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        self.checkReachable()
    }
        
    func sessionDidDeactivate(_ session: WCSession) {
        self.session.activate()
    }
    
    func checkReachable() {
        reachable = session.isReachable
    }
    
    func saveWorkout () {
        let newWorkout = Workout(context: self.dataContainer.dataContainer.viewContext)
        
        newWorkout.start = self.workoutStart
        newWorkout.end = self.workoutEnd
        newWorkout.calories = self.activeCalories
        newWorkout.distance = self.distance
        newWorkout.heartrate = self.heartrate
        newWorkout.pace = self.currentPace
        newWorkout.timestamp = self.timestamp
        newWorkout.totaltime = Int64(self.getTotalTime(data: self.timestamp))
        
        do {
            try self.dataContainer.dataContainer.viewContext.save()
        } catch {
            let error = error as NSError
            print(error)
        }
    }
    
    func resetWorkout() {
        DispatchQueue.main.async {
            self.timestamp = [0]
            self.workoutStatus = "Not Running"
            self.heartrate = [0]
            self.distance = [0]
            self.activeCalories = [0]
            self.currentPace = [0]
        }
    }
    
    func getMetric (data: [Double]) -> Double {
        if let value = data.last {
            return value
        }
        return 0
    }
    
    func getTotalTime (data: [Int]) -> Int {
        if let value = data.last {
            return value
        }
        return 0
    }
}
