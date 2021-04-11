//
//  BoardStatusView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI
import CocoaMQTT

struct BoardStatusView: View {
    
    @State private var redLED = false
    @State private var greenLED = false
        
    @EnvironmentObject var mqtt: MQTTManager
    
    var body: some View {
        VStack{
            HStack{
                Text("Hoverboard Status: ")
                    .font(.title)
                    .padding(.trailing)
                HStack {
                    if mqtt.status {
                        Image ("connected-icon")
                    } else {
                        Image ("disconnected-icon")
                    }
                    
                    Button(action: {
                        self.mqtt.connect()
                        }
                    ) {
                        Image ("refresh-icon")
                    }
                }
            }
            
            Toggle("Red LED On", isOn: $redLED).onChange(of: redLED, perform: { value in
                if redLED {
                    self.mqtt.sendMessage(topic: "rpi/led", message: "red/on")
                }
                else {
                    self.mqtt.sendMessage(topic: "rpi/led", message: "red/off")
                }
            })
            
            Toggle("Green LED On", isOn: $greenLED).onChange(of: greenLED, perform: { value in
                if greenLED {
                    self.mqtt.sendMessage(topic: "rpi/led", message: "green/on")
                }
                else {
                    self.mqtt.sendMessage(topic: "rpi/led", message: "green/off")
                }
            })
            
            Text(self.mqtt.buttonCount)
        }
    }
}

struct BoardStatusView_Previews: PreviewProvider {
    static var previews: some View {
        BoardStatusView()
    }
}
