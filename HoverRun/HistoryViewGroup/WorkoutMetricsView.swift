//
//  WorkoutMetricsView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-29.
//

import SwiftUI

struct WorkoutMetricsView: View {
    
    var currentWorkout: Workout
    
    var body: some View {
        HStack(alignment: .top, spacing: 50){
            VStack(alignment: .leading, spacing: 25.0){
                Image("run-90-icon")
                
                VStack(alignment: .leading){
                    Text("Total Time")
                    Text(elapsedTimeString(elapsed: secondsToHoursMinutesSeconds(seconds: Int(currentWorkout.totaltime))))
                }
                
                VStack(alignment: .leading){
                    Text("Calories Burned")
                    Text("\((getMetric(data: currentWorkout.calories ?? [0])), specifier: "%.1f") Cal")
                }
                
                VStack(alignment: .leading){
                    Text("Avg Pace")
                    Text("\(getAvgPace(data: (getMetric(data: currentWorkout.distance ?? [0]))/1000, totalTime: Double(currentWorkout.totaltime)))/km")
                }
            }
            
            VStack(alignment: .leading, spacing: 20.0){
                VStack(alignment: .leading) {
                    Text("Start Time: \(timeString(date: currentWorkout.start ?? Date()))")
                    Text("End Time: \(timeString(date: currentWorkout.end ?? Date())) ")
                }
                .padding(.bottom, 25.0)
                
                VStack(alignment: .leading){
                    Text("Session Type: \(currentWorkout.type ?? " ")")
                    Text("Session Limit: \(currentWorkout.limit ?? "None")")
                    Text("Session Intensity: \(currentWorkout.intensity, specifier: "%.1f")")
                }
                
                VStack(alignment: .leading){
                    Text("Distance")
                    Text("\((getMetric(data: currentWorkout.distance ?? [0]))/1000, specifier: "%.2f") km")
                }.padding(.bottom, 5.0)
                
                VStack(alignment: .leading){
                    Text("Avg. Heart Rate")
                    Text("\((getAverage(data: currentWorkout.heartrate ?? [0])), specifier: "%.0f") BPM")
                }
            }
            .padding(.top, 24.0)
        }
    }
    
    func timeString (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func secondsToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
      return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // Convert the seconds, minutes, hours into a string.
    func elapsedTimeString(elapsed: (h: Int, m: Int, s: Int)) -> String {
        return String(format: "%d:%02d:%02d", elapsed.h, elapsed.m, elapsed.s)
    }
    
    func getMetric (data: [Double]) -> Double {
        if let value = data.last {
            return value
        }
        return 0
    }
    
    func getAverage (data: [Double]) -> Double {
        let fdata = data.filter {$0 > 0}
        
        return fdata.reduce(0.0, +)/Double(fdata.count)
    }
    
    func getAvgPace (data: Double, totalTime: Double) -> String {
        if data > 0 {
            let avg: Int = Int(totalTime / data)
            let avgmin: Int = Int((avg % 3600) / 60)
            let avgsec: Int = Int((avg % 3600) % 60)
            
            return String(format: "%d'%d''", avgmin, avgsec)
        }
        else{
            return String(format: "0'0''")
        }
    }
}

