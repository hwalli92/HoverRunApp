//
//  WorkoutProgramMenu.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-01-04.
//

import SwiftUI

struct WorkoutProgramMenu: View {
    var body: some View {
        GroupBox {
            DisclosureGroup("Menu 1") {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
        }
    }
}

struct WorkoutProgramMenu_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutProgramMenu()
    }
}
