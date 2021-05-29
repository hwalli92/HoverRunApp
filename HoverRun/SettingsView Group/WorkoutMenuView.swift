//
//  WorkoutMenuView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import SwiftUI

struct WorkoutMenuView: View {
    
    @ObservedObject var trainingManager = TrainingProgramManager()
    
    var body: some View {
        Picker("Workout Program", selection: $trainingManager.trainingProgram){
            ForEach(TrainingProgramManager.trainingPrograms, id:\.self){
                Text($0)
            }
        }
        if trainingManager.trainingProgram !=  "Manual"{
            Stepper("Training Level: \(trainingManager.trainingLevel, specifier: "%.1f")", value: $trainingManager.trainingLevel, in: 0...8, step: 0.5)
            
            if trainingManager.trainingProgram == "Timed"{
                Stepper("Time Limit: \(trainingManager.timeLimit, specifier: "%.1f") minutes", value: $trainingManager.timeLimit, in: 0...20, step: 1.0)
            }
            
            if trainingManager.trainingProgram == "Distance"{
                Stepper("Run Distance: \(trainingManager.distanceLimit, specifier: "%.1f") km", value: $trainingManager.distanceLimit, in: 0...10, step: 0.5)
            }
        }
    }
}

struct WorkoutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView(trainingManager: TrainingProgramManager())
    }
}
