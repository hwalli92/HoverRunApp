//
//  RunMetricsView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct RunMetricsView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        VStack(alignment: .leading) {
            HeartRateView()
            CaloriesView()
            DistanceView()
            PaceView()
            Text("Status: \(trainer.watch.workoutStatus)")
        }
        .frame(width: 230.0, alignment: .leading)
    }
}

struct RunMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        RunMetricsView().environmentObject(TrainingProgramManager())
    }
}
