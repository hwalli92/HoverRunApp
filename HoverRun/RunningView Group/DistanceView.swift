//
//  DistanceView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct DistanceView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        HStack{
            Image("distance-icon")
            Text ("\(watch.getMetric(data: watch.distance), specifier:"%.1f") m")
                .font(.title)
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView().environmentObject(WatchManager())
    }
}
