//
//  HoverStartStopView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HoverStartStopView: View {
    
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack(spacing: 50.0) {
            Button(action: {
                trainer.setTrainingStatus(status: "start")
            }, label: {
                Image ("start-icon").resizable().frame(width: 100.0, height: 100.0)
            })
            Button(action: {
                trainer.setTrainingStatus(status: "stop")
            }, label: {
                Image ("stop-icon").resizable().frame(width: 100.0, height: 100.0)
            })
        }
    }
}

struct HoverStartStopView_Previews: PreviewProvider {
    static var previews: some View {
        HoverStartStopView().environmentObject(TrainingProgramManager())
    }
}
