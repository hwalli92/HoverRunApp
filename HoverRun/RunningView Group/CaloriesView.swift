//
//  CaloriesView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct CaloriesView: View {
    
    //@EnvironmentObject var watch: WatchManager
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        HStack{
            Image("calories-icon")
            Text ("\(trainer.watch.getMetric(data: trainer.watch.activeCalories), specifier:"%.1f") Cal")
                .font(.title)
        }
    }
}

struct CaloriesView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesView().environmentObject(TrainingProgramManager())
    }
}
