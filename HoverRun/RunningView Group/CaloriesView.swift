//
//  CaloriesView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct CaloriesView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        HStack{
            Image("calories-icon").resizable().frame(width: 50, height: 50)
            Text ("\(watch.getMetric(data: watch.activeCalories), specifier:"%.0f") Cal")
                .font(.title)
        }
    }
}

struct CaloriesView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesView().environmentObject(WatchManager())
    }
}
