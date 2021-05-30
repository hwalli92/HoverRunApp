//
//  WorkoutMenuView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import SwiftUI

struct WorkoutMenuView: View {
    
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        Picker("Workout Program", selection: $trainer.trainingProgram){
            ForEach(TrainingProgramManager.trainingPrograms, id:\.self){
                Text($0)
            }
        }
        if trainer.trainingProgram !=  "Manual"{
            Stepper("Training Level: \(trainer.trainingLevel, specifier: "%.1f")", value: $trainer.trainingLevel, in: 0...8, step: 0.5)
            
            if trainer.trainingProgram == "Timed"{
                Stepper("Time Limit: \(trainer.timeLimit, specifier: "%.1f") minutes", value: $trainer.timeLimit, in: 0...20, step: 1.0)
            }
            
            if trainer.trainingProgram == "Distance"{
                Stepper("Run Distance: \(trainer.distanceLimit, specifier: "%.1f") km", value: $trainer.distanceLimit, in: 0...10, step: 0.5)
            }
        }
    }
}

struct WorkoutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView()
    }
}
