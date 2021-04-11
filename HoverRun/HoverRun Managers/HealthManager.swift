//
//  HealthManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import Foundation

class HealthManager: NSObject, ObservableObject {
    
    var dataContainer = DataManager.dataManager
    
    var workoutStart: Date = Date()
    var workoutEnd: Date = Date()
    var workoutTime: Int = 0
    var timestamp: [Int] = [0]
    
    @Published var workoutStatus: String = "Not Started"
    @Published var heartrate: [Double] = [0]
    @Published var distance: [Double] = [0]
    @Published var activeCalories: [Double] = [0]
    @Published var currentPace: [Double] = [0]
    
    
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
