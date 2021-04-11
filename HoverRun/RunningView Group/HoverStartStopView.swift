//
//  HoverStartStopView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HoverStartStopView: View {
    var body: some View {
        HStack(spacing: 50.0) {
            Image ("start-icon").resizable().frame(width: 100.0, height: 100.0)
            Image ("stop-icon").resizable().frame(width: 100.0, height: 100.0)
        }
    }
}

struct HoverStartStopView_Previews: PreviewProvider {
    static var previews: some View {
        HoverStartStopView()
    }
}
