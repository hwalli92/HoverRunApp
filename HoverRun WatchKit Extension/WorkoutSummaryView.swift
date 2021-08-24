//
//  WorkoutSummaryView.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2021-08-24.
//

import Foundation
import SwiftUI
import WatchKit

struct WorkoutSummaryView: View {
    
    @EnvironmentObject var workoutSession: WorkoutManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Total Time").frame(alignment: .leading)
                    .font(.system(.title3, design: .rounded))
                
                Text("\(elapsedTimeString(elapsed: secondsToHoursMinutesSeconds(seconds: workoutSession.elapsedSeconds)))").frame(alignment: .leading)
                    .font(.system(.title2, design: .rounded).monospacedDigit().lowercaseSmallCaps())
                Divider()
                
                Text("Total Distance").frame(alignment: .leading)
                    .font(.system(.title3, design: .rounded))
                Text("\(workoutSession.distance/1000, specifier: "%.2f") km").frame(alignment: .leading)
                    .font(.system(.title2, design: .rounded).monospacedDigit().lowercaseSmallCaps())
                Divider()
                
                Text("Avg Heart Rate").frame(alignment: .leading)
                    .font(.system(.title3, design: .rounded))
                Text("\(workoutSession.avgHR, specifier: "%.0f") bpm").frame(alignment: .leading)
                    .font(.system(.title2, design: .rounded).monospacedDigit().lowercaseSmallCaps())
                
                Button("Done") {
                    workoutSession.workoutSummary = false
                }
            }
        }
        .navigationBarHidden(true)
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

struct WorkoutSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSummaryView().environmentObject(WorkoutManager())
    }
}
