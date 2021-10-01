//
//  WorkoutGraphView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-29.
//

import SwiftUI
import SwiftUICharts

struct WorkoutGraphView: View {
    
    var dataType: String
    var yValues: [Double]
    
    var body: some View {
        LineView(data: yValues
                    .filter{$0 > 0}
                    .filter{!$0.isNaN}
                    .filter{!$0.isInfinite}, title: dataType)
    }
}

extension Array {
    var popFirst: Array {
        return Array(self.dropFirst())
    }
}

struct WorkoutGraphView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutGraphView(dataType: "Heart Rate", yValues: [0.0,50.0,60.0,125.0,100.0,70.0])
    }
}
