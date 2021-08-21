//
//  WorkoutMenuView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-05-29.
//

import SwiftUI

struct WorkoutMenuView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        Picker("Workout Program", selection: $watch.trainingProgram){
            ForEach(WatchManager.trainingPrograms, id:\.self){
                Text($0)
            }
        }
        
        Stepper("Training Level: \(watch.trainingLevel, specifier: "%.1f")", value: $watch.trainingLevel, in: 0...5, step: 0.5)
            
        if watch.trainingProgram == "Timed"{
            Stepper("Time Limit: \(watch.trainingLimit, specifier: "%.1f") minutes", value: $watch.trainingLimit, in: 0...20, step: 0.5)
        }
            
        if watch.trainingProgram == "Distance"{
            Stepper("Run Distance: \(watch.trainingLimit, specifier: "%.1f") km", value: $watch.trainingLimit, in: 0...10, step: 0.5)
        }
    }
}

struct WorkoutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView().environmentObject(WatchManager())
    }
}
