//
//  ContentView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var healthManager: HealthManager
    @EnvironmentObject var watch: WatchManager
    @EnvironmentObject var mqtt: MQTTManager
    
    
    @State private var defaultView = 1

    var body: some View {
        TabView (selection: $defaultView) {
            NavigationView {
                StatusView().navigationBarTitle(Text("HoverRun Settings"), displayMode: .inline)
            }.tabItem {
                Image("status-icon")
            }.tag(1)
            NavigationView {
                RunningView().navigationBarTitle(Text("HoverRun Workout"), displayMode: .inline)
            }.tabItem {
                Image("run-icon")
            }.tag(2)
            NavigationView {
                HistoryView().navigationBarTitle(Text("HoverRun Workout History"), displayMode: .inline)
            }.tabItem{
                Image("history-icon")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WatchManager())
    }
}
