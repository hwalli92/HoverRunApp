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
        HStack(alignment: .center) {
            VStack(alignment: .leading){
                HeartRateView()
                DistanceView()
            }.padding(.trailing, 5.0).frame(alignment: .topLeading)
            
            VStack(alignment: .leading){
                CaloriesView()
                PaceView()
            }.padding(.trailing, 5.0).frame(alignment: .topTrailing)
        }
        
    }
}

struct RunMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        RunMetricsView().environmentObject(TrainingProgramManager())
    }
}
