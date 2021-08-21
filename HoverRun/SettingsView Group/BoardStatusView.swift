//
//  BoardStatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI
import CocoaMQTT

struct BoardStatusView: View {
        
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Text("Hoverboard: ")
                .padding(.trailing, 110.0)
            HStack {
                if trainer.mqtt.status {
                    Image ("connected-icon")
                } else {
                    Image ("disconnected-icon")
                }
            }
        }
            
    }
}

struct BoardStatusView_Previews: PreviewProvider {
    static var previews: some View {
        BoardStatusView().environmentObject(TrainingProgramManager())
    }
}
