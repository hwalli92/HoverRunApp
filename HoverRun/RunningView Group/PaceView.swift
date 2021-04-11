//
//  PaceView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct PaceView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        HStack{
            Image("pace-icon")
            Text ("\(watch.getMetric(data: watch.currentPace), specifier:"%.1f") min/km")
                .font(.title)
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView().environmentObject(WatchManager())
    }
}
