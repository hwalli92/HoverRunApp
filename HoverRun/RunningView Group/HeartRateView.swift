//
//  HeartRateView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HeartRateView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Image("heartrate-icon")
            Text ("\(trainer.watch.getMetric(data: trainer.watch.heartrate), specifier:"%.0f") BPM")
                .font(.title)
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView().environmentObject(TrainingProgramManager())
    }
}
