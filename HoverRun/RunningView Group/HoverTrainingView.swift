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
            Text("Training Session Details").font(.largeTitle).padding(.bottom, 5.0)
            
            Text("Status:  \(trainer.getTrainingStatus())")
                .font(.title2)
                .padding(.bottom, 5.0)
            
            Text("Session Type:  \(trainer.trainingProgram)")
                .font(.title2)
                .padding(.bottom, 5.0)
            
            if trainer.trainingProgram != "Manual" {
                
                if trainer.trainingProgram == "Timed" {
                    Text("Time Limit:  \(trainer.trainingLimit, specifier: "%.1f")")
                        .font(.title2)
                        .padding(.bottom, 5.0)
                }
                
                if trainer.trainingProgram == "Distance" {
                    Text("Distance Limit:  \(trainer.trainingLimit, specifier: "%.1f")")
                        .font(.title2)
                        .padding(.bottom, 5.0)
                }
                
                Text("Intensity Level:  \(trainer.trainingLevel, specifier: "%.1f")")
                    .font(.title2)
            }
        }
    }
}

struct HoverTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        HoverTrainingView().environmentObject(TrainingProgramManager())
    }
}
