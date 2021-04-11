//
//  WorkoutSummaryView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-29.
//

import SwiftUI

struct WorkoutSummaryView: View {
    
    var currentWorkout: Workout
    
    var body: some View {
        HStack {
            Text (dateTimeString(date: currentWorkout.start ?? Date())).font(.headline).frame(width: 180.0, alignment: .leading)
                        
            VStack{
                Text ("Total Time")
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
                Text (elapsedTimeString(elapsed: secondsToHoursMinutesSeconds(seconds: Int(currentWorkout.totaltime))))
                                .font(.headline)
                                .multilineTextAlignment(.trailing)
            }
            .padding(.leading, 60.0)
        }
    }
    
    func dateTimeString (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "MMM d, y @ HH:mm"
        return formatter.string(from: date)
    }
    
    func secondsToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
      return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // Convert the seconds, minutes, hours into a string.
    func elapsedTimeString(elapsed: (h: Int, m: Int, s: Int)) -> String {
        return String(format: "%d:%02d:%02d", elapsed.h, elapsed.m, elapsed.s)
    }
}
