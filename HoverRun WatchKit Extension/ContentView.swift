//
//  ContentView.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var workoutSession: WorkoutManager
    @State var workoutInProgress = false
    
    let screenHeight = WKInterfaceDevice.current().screenBounds.size.height
    
    var body: some View {
        PageView(workoutInProgress: self.$workoutInProgress)
        .opacity(self.workoutInProgress ? 1 : 0)
        .animation(.easeInOut(duration: 0.3))
        .overlay(
            StartView(startAction: startAction)
                .offset(CGSize(width: 0, height: self.workoutInProgress ? self.screenHeight : 0))
                .animation(.easeInOut(duration: 0.3)))
    }
    
    func startAction() {
        workoutSession.startWorkout()
        withAnimation {
            workoutInProgress = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
