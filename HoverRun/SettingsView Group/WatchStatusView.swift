//
//  WatchStatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct WatchStatusView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Text("Apple Watch: ")
                .padding(.trailing, 105.0)
            HStack {
                if trainer.watch.reachable {
                    Image ("connected-icon")
                } else {
                    Image ("disconnected-icon")
                }
            }
        }
    }
}

struct WatchStatusView_Previews: PreviewProvider {
    static var previews: some View {
        WatchStatusView().environmentObject(TrainingProgramManager())
    }
}
