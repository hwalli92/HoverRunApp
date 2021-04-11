//
//  WorkoutDetailsView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI
import MessageUI

struct GraphData: Hashable {
    let data: [Double]
    let dataType: String
}

struct WorkoutDetailsView: View {
    
    var currentWorkout: Workout
    
    var graphData: [GraphData] {
        [GraphData(data: currentWorkout.heartrate ?? [0], dataType: "Heart Rate"), GraphData(data: currentWorkout.pace ?? [0], dataType: "Pace")]
    }
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        NavigationView {
            List {
                WorkoutMetricsView(currentWorkout: currentWorkout)
                    .padding(.leading, 25.0)
                

                ForEach(self.graphData, id:\.self) { data in
                    WorkoutGraphView(dataType: data.dataType, yValues: data.data)
                        .padding(.bottom, 300.0)
                }
            }.padding(.top, -280.0)
        }.navigationBarTitle(Text("\(dateString(date: currentWorkout.start ?? Date()))"))
        .navigationBarItems(trailing: Button(action: {self.isShowingMailView.toggle()}, label: {
            Image(systemName: "square.and.arrow.up")
        }).disabled(!MFMailComposeViewController.canSendMail()).sheet(isPresented: $isShowingMailView, content: {
            MailView(result: self.$result, workoutData: currentWorkout)
        }))
    }
    
    func dateString (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, y"
        return formatter.string(from: date)
    }
}
