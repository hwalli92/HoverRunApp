//
//  PIDSettingsView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-08-22.
//

import SwiftUI

struct PIDSettingsView: View {
        
    @Binding var kp: Int
    @Binding var ki: Double
    @Binding var kd: Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Current Kp: \(kp)")
                TextField("New Kp", text: Binding(
                            get: { String(kp) },
                            set: { kp = Int($0) ?? 0 })).padding(.leading, 125.0)
                    .keyboardType(.default).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack{
                Text("Current Ki: \(ki, specifier: "%.2f")")
                TextField("New Ki", text: Binding(
                            get: { String(ki) },
                            set: { ki = Double($0) ?? 0 })).padding(.leading, 125.0)
                    .keyboardType(.default).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack{
                Text("Current Kd: \(kd)")
                TextField("New Kd", text: Binding(
                            get: { String(kd) },
                            set: { kd = Int($0) ?? 0 })).padding(.leading, 125.0)
                    .keyboardType(.default).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            
        }
    }
}

//struct PIDSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PIDSettingsView().environmentObject(WatchManager())
//    }
//}
