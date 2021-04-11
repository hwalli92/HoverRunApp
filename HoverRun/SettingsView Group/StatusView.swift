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
        VStack {
            WatchStatusView()
            
            BoardStatusView ()
        }
        
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView().environmentObject(WatchManager())
    }
}
