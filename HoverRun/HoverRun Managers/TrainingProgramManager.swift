//
//  TrainingProgramManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import Foundation

class TrainingProgramManager: ObservableObject {
    
    var mqtt = MQTTManager()
    
    @Published var trainingProgram = "Time"
    @Published var trainingLevel = 1.0
    @Published var trainingLimit = 5.0
    @Published var trainingStatus = "stop"
    static let trainingPrograms = ["Manual", "Time", "Distance"]
    
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
}
