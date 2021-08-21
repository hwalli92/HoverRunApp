//
//  HoverTrainingView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-30.
//

import SwiftUI

struct HoverTrainingView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        VStack {
            Text("Training Session Details").font(.largeTitle).padding(.bottom, 5.0)
            
            Text("Status:  \(watch.workoutStatus)")
                .font(.title2)
                .padding(.bottom, 5.0)
            
            Text("Session Type:  \(watch.trainingProgram)")
                .font(.title2)
                .padding(.bottom, 5.0)
            
            if watch.trainingProgram != "Manual" {
                
                if watch.trainingProgram == "Timed" {
                    Text("Time Limit:  \(watch.trainingLimit, specifier: "%.1f")")
                        .font(.title2)
                        .padding(.bottom, 5.0)
                }
                
                if watch.trainingProgram == "Distance" {
                    Text("Distance Limit:  \(watch.trainingLimit, specifier: "%.1f")")
                        .font(.title2)
                        .padding(.bottom, 5.0)
                }
                
                Text("Intensity Level:  \(watch.trainingLevel, specifier: "%.1f")")
                    .font(.title2)
            }
        }
    }
}

struct HoverTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        HoverTrainingView().environmentObject(WatchManager())
    }
}
