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
            if (trainer.trainingStatus == "Stop" || trainer.trainingStatus == "Pause"){
                Button(action: {
                    trainer.setTrainingStatus(status: "Start")
                }, label: {
                    Image ("start-icon").resizable().frame(width: 100.0, height: 100.0)
                })
            }
            else{
                Button(action: {
                    trainer.setTrainingStatus(status: "Pause")
                }, label: {
                    Image ("pause-icon").resizable().frame(width: 100.0, height: 100.0)
                })
            }
            
            Button(action: {
                trainer.setTrainingStatus(status: "Stop")
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
