//
//  StatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct StatusView: View {
    
    @EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        Form {
            
            Section(header: Text("Status")){
                WatchStatusView()
            
                BoardStatusView()
            }
            
            Section(header: Text("Run Settings")){
                WorkoutMenuView()
                
                Button(action: {
                    trainer.updateProgram()
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
