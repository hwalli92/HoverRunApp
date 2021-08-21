//
//  HoverTrainingView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-30.
//

import SwiftUI

struct HoverTrainingView: View {
    
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        VStack {
            Text("Training Status:  \(trainer.trainingStatus)")
            
            Text("Training Type:  \(trainer.trainingProgram)")
            
            if trainer.trainingProgram != "Manual" {
                
                if trainer.trainingProgram == "Timed" {
                    Text("Training Time Limit:  \(trainer.trainingLimit, specifier: "%.1f")")
                }
                
                if trainer.trainingProgram == "Distance" {
                    Text("Training Distance Limit:  \(trainer.trainingLimit, specifier: "%.1f")")
                }
                
                Text("Training Level:  \(trainer.trainingLevel, specifier: "%.1f")")
            }
        }
    }
}

struct HoverTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        HoverTrainingView().environmentObject(TrainingProgramManager())
    }
}
