//
//  HoverSpeedView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HoverSpeedView: View {
    
    @EnvironmentObject var trainer: TrainingProgramManager
    
    var body: some View {
        VStack{
            Button(action: {
                trainer.updateLevel(factor: 0.5)
            }, label: {
                Image ("speed-up-icon")
            })
            
            Text ("\(trainer.trainingLevel, specifier: "%.1f")")
                .font(.title)
            
            Button(action: {
                trainer.updateLevel(factor: -0.5)
            }, label: {
                Image ("speed-down-icon")
            })
        }
    }
}

struct HoverSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        HoverSpeedView().environmentObject(TrainingProgramManager())
    }
}
