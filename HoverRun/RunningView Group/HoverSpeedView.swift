//
//  HoverSpeedView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HoverSpeedView: View {
    var body: some View {
        VStack{
            Image ("speed-up-icon")
            Text ("0.0 KM/HR")
                .font(.title)
            Image ("speed-down-icon")
        }
    }
}

struct HoverSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        HoverSpeedView()
    }
}
