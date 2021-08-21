//
//  HoverRunApp.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

@main
struct HoverRunApp: App {
    
    let dataContainer = DataManager.dataManager
    //let watch = WatchManager()
    let trainer = TrainingProgramManager()
        
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataContainer.dataContainer.viewContext)
                .environmentObject(trainer)
        }
    }
}
