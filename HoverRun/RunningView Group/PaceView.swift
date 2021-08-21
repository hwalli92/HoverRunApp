//
//  PaceView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct PaceView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Image("pace-icon").resizable().frame(width: 50, height: 50)
            Text ("\(trainer.watch.getMetric(data: trainer.watch.currentPace), specifier:"%.2f") min/km")
                .font(.title)
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView().environmentObject(TrainingProgramManager())
    }
}
