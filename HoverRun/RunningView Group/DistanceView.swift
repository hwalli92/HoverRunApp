//
//  DistanceView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct DistanceView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Image("distance-icon")
            Text ("\(trainer.watch.getMetric(data: trainer.watch.distance), specifier:"%.1f") m")
                .font(.title)
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView().environmentObject(TrainingProgramManager())
    }
}
