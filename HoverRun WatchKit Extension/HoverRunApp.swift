//
//  HoverRunApp.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

@main
struct HoverRunApp: App {
    
    let workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(workoutManager)
            }
        }
    }
}
