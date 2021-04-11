//
//  WorkoutView.swift
//  WorkoutManager WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-22.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var workoutSession: WorkoutManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(elapsedTimeString(elapsed: secondsToHoursMinutesSeconds(seconds: workoutSession.elapsedSeconds)))").frame(alignment: .leading)
                .font(Font.system(size: 24, weight: .semibold, design: .default).monospacedDigit())
                
            Text("\(workoutSession.activeCalories, specifier: "%.1f") cal")
            .font(Font.system(size: 24, weight: .regular, design: .default).monospacedDigit())
            .frame(alignment: .leading)
            
            Text("\(workoutSession.heartrate, specifier: "%.0f") BPM")
            .font(Font.system(size: 24, weight: .regular, design: .default).monospacedDigit())
            
            Text("\(workoutSession.distance, specifier: "%.1f") m")
            .font(Font.system(size: 24, weight: .regular, design: .default).monospacedDigit())
            
            Text("\(workoutSession.pace, specifier: "%.1f") min/km")
            .font(Font.system(size: 24, weight: .regular, design: .default).monospacedDigit())
            
            Spacer().frame(width: 1, height: 8, alignment: .leading)
             
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
    }
    
    // Convert the seconds into seconds, minutes, hours.
    func secondsToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
      return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // Convert the seconds, minutes, hours into a string.
    func elapsedTimeString(elapsed: (h: Int, m: Int, s: Int)) -> String {
        return String(format: "%d:%02d:%02d", elapsed.h, elapsed.m, elapsed.s)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView().environmentObject(WorkoutManager())
    }
}
