//
//  StartView.swift
//  WorkoutManager WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-22.
//

import SwiftUI
import Combine

struct StartView: View {
    
    @EnvironmentObject var workoutSession: WorkoutManager
    
    let startAction: (() -> Void)? 
    
    var body: some View {
        StartButton(action: {
            self.startAction!() // FixMe!
        }).onAppear() {
            self.workoutSession.requestAuthorization()
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var startAction = { }
    
    static var previews: some View {
        StartView(startAction: startAction)
        .environmentObject(WorkoutManager())
    }
}

