//
//  StatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct StatusView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    @State var kp: Int = 10
    @State var ki: Double = 0.0
    @State var kd: Int = 0
    
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
            
            Section(header: Text("PID Settings")){
                PIDSettingsView(kp: self.$kp, ki: self.$ki, kd: self.$kd)
                
                Button(action: {
                    watch.updatePID(kp: self.kp, ki: self.ki, kd: self.kd)
                }, label: {
                    Text("Update PID Settings")
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
