//
//  HeartRateView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HeartRateView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        HStack{
            Image("heartrate-icon").resizable().frame(width: 50, height: 50)
            Text ("\(watch.getMetric(data: watch.heartrate), specifier:"%.0f") BPM")
                .font(.title)
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView().environmentObject(WatchManager())
    }
}
