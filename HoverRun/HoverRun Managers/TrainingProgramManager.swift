//
//  TrainingProgramManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import Foundation

class TrainingProgramManager: ObservableObject {
    
    var mqtt = MQTTManager()
    var watch = WatchManager()
    
    @Published var trainingProgram = "Timed"
    @Published var trainingLevel = 1.0
    @Published var trainingLimit = 5.0
    var trainingStatus = "Stop"
    static let trainingPrograms = ["Manual", "Timed", "Distance"]
    
    func updateProgram() {
        let trainingDetails = ["Type": self.trainingProgram, "Level": self.trainingLevel, "Limit": self.trainingLimit, "Status": self.trainingStatus] as [String : Any]
        
        if let JSONData = try? JSONSerialization.data(withJSONObject: trainingDetails, options: []){
            let JSONText = String(data: JSONData, encoding: .utf8) ?? "None"
            self.mqtt.sendMessage(topic: "hvrrun/training", message: JSONText)
        }
        
    }
    
    func updateLevel(factor: Double) {
        if self.trainingLevel > 0.0 && self.trainingLevel < 8.0 {
            self.trainingLevel += factor
        }
    }
    
    func setTrainingStatus(status: String) {
        self.trainingStatus = status
    }
    
    func getTrainingStatus() -> String{
        if self.watchEnabled{
            return watch.workoutStatus
        }
        else{
            return self.trainingStatus
        }
    }
}
