//
//  TrainingProgramManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import Foundation

class TrainingProgramManager: ObservableObject {
    
    @Published var trainingProgram = "Manual"
    @Published var trainingLevel = 1.0
    @Published var timeLimit = 5.0
    @Published var distanceLimit = 2.0
    
    static let trainingPrograms = ["Manual", "Timed", "Distance"]
    
    func updateProgram() {
        
    }
}
