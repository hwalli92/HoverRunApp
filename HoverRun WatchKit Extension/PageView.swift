//
//  PageView.swift
//  WorkoutManager WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-22.
//

import SwiftUI

struct PageView: View {
    @EnvironmentObject var workoutSession: WorkoutManager

    @State var pageSelection: PageSelection = .workout

    @Binding var workoutInProgress: Bool
    
    enum PageSelection {
        case menu
        case workout
    }
    
    var body: some View {

        TabView(selection: $pageSelection) {

            MenuView(pauseAction: pauseAction, endAction: endAction)
                .tag(PageSelection.menu)
            
            WorkoutView()
                .tag(PageSelection.workout)
        }.tabViewStyle(PageTabViewStyle())
    }
    
    func pauseAction() {
        withAnimation { self.pageSelection = .workout }
        workoutSession.togglePause()
    }
    
    func endAction() {
        print("PageView got endAction()")
        workoutSession.endWorkout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.pageSelection = .workout
        }

        workoutInProgress = false
    }
}

struct PageView_Previews: PreviewProvider {
    @State static var workoutInProgress = true
    static var previews: some View {
        Group {
            PageView(pageSelection: .menu, workoutInProgress: $workoutInProgress)
            .previewDisplayName("pageSelection: .menu")
                
            PageView(pageSelection: .workout, workoutInProgress: $workoutInProgress)
            .previewDisplayName("pageSelection: .workout")
        }
        .environmentObject(WorkoutManager())
    }
}
