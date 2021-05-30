//
//  TrainingProgramManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import Foundation

class TrainingProgramManager: ObservableObject {
    
    var mqtt = MQTTManager()
    
    @Published var trainingProgram = "Timed"
    @Published var trainingLevel = 1.0
    @Published var timeLimit = 5.0
    @Published var distanceLimit = 2.0
    @Published var trainingStatus = "stop"
    static let trainingPrograms = ["Manual", "Timed", "Distance"]
    
    func updateProgram() {
        let trainingDetails = ["Type": self.trainingProgram, "Level": self.trainingLevel, "Limit": self.timeLimit, "Status": self.trainingStatus] as [String : Any]
        
        if let JSONData = try? JSONSerialization.data(withJSONObject: trainingDetails, options: []){
            let JSONText = String(data: JSONData, encoding: .utf8) ?? "None"
            self.mqtt.sendMessage(topic: "hvrrun/training", message: JSONText)
        }
        
    }
    
    func updateLevel(factor: Double) {
        self.trainingLevel += factor
    }
    
    func setTrainingStatus(status: String) {
        self.trainingStatus = status
    }
}
