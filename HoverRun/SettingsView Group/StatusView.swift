//
//  StatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct StatusView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        Form {
            
            Section(header: Text("Status")){
                
                WatchStatusView()
                BoardStatusView()
                
                Button(action: {
                    watch.mqtt.connect()
                    watch.checkReachable()
                }, label: {
                    Text("Refresh Connection Status")
                })
            }
            
            Section(header: Text("Training Settings")){
                WorkoutMenuView()
                
                Button(action: {
                    watch.updateProgram()
                }, label: {
                    Text("Update Training Settings")
                })
            }
            
        }
        
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView().environmentObject(WatchManager())
    }
}
