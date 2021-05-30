//
//  RunningView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct RunningView: View {
    
    @EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        VStack(spacing: 50.0){
            HStack{
                RunMetricsView()
                HoverSpeedView()
            }
            
            HoverStartStopView()
            
            HoverTrainingView()
        }
    }
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView().environmentObject(WatchManager()).environmentObject(TrainingProgramManager())
    }
}
