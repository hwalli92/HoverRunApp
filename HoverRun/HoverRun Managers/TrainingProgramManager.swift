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
        
    }
    
    func updateLevel(factor: Double) {
        self.trainingLevel += factor
    }
    
    func setTrainingStatus(status: String) {
        self.trainingStatus = status
    }
}
