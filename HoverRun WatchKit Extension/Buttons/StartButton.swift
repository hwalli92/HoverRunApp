//
//  StartButton.swift
//  WorkoutManager WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-22.
//

import SwiftUI
import UIKit

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill(Color(UIColor.green))
            .overlay(
                configuration.label
                    .foregroundColor(.black)
                    .font(Font.system(size: 36, weight: .black, design: .default))
            )
            .frame(width: 130, height: 130)
    }
}


struct StartButton: View {
    var action = { print("Start button tapped!") }
    
    var body: some View {
        Button(action: { self.action() }) {
            Text("START")
        }
        .buttonStyle(StartButtonStyle())
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}
