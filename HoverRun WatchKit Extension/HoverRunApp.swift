//
//  HoverRunApp.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-27.
//  Template by Apple found here: https://developer.apple.com/documentation/healthkit/workouts_and_activity_rings/build_a_workout_app_for_apple_watch
//

import SwiftUI

@main
struct HoverRunApp: App {
    
    @StateObject private var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .sheet(isPresented: $workoutManager.workoutSummary) {
                WorkoutSummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}
