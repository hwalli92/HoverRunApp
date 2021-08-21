//
//  HoverSpeedView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HoverSpeedView: View {
    
    @EnvironmentObject var watch: WatchManager
    
    var body: some View {
        HStack{
            Button(action: {
                watch.updateLevel(factor: 0.5)
            }, label: {
                Image ("speed-up-icon")
            })
            .padding(.trailing, 20.0)
            
            Button(action: {
                watch.updateLevel(factor: -0.5)
            }, label: {
                Image ("speed-down-icon")
            })
            .padding(.leading, 20.0)
        }
    }
}

struct HoverSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        HoverSpeedView().environmentObject(WatchManager())
    }
}
