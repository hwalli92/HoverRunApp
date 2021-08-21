//
//  MenuView.swift
//  WorkoutManager WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var workoutSession: WorkoutManager
    
    @State var workoutPaused: Bool = false
    let pauseAction: (() -> Void)
    let endAction: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center) {

            Spacer()
            MenuButton(title: "End", symbolName: "xmark.circle.fill", action: {
                print("End tapped!")
                self.endAction()
                self.workoutPaused = false
            }).padding(.trailing, 5.0)
            
            Spacer()
            
            MenuButton(title: workoutPaused ? "Resume" : "Pause", symbolName: workoutPaused ? "play.circle.fill" : "pause.circle.fill", action: {
                self.workoutPaused.toggle()
                self.pauseAction()
            }).padding(.leading, 5)
            Spacer()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var pauseAction = { }
    static var endAction = { }
    
    static var previews: some View {

        Group {
            MenuView(pauseAction: pauseAction, endAction: endAction)
            .previewDevice("Apple Watch Series 3 - 38mm")
            .previewDisplayName("38 mm")
            
            MenuView(pauseAction: pauseAction, endAction: endAction)
            .previewDevice("Apple Watch Series 5 - 40mm")
            .previewDisplayName("40 mm")
//
//            MenuView(pauseAction: pauseAction, endAction: endAction)
//            .previewDevice("Apple Watch Series 5 - 44mm")
//            .previewDisplayName("44 mm")
        }
        .environmentObject(WorkoutManager())
    }
}
