//
//  MQTTManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-03-19.
//

import Foundation
import CocoaMQTT

class MQTTManager: CocoaMQTTDelegate, ObservableObject {

    static let shared = MQTTManager()

    var mqttClient: CocoaMQTT

    @Published var status: Bool = false
    @Published var msgAck: String = "0"
    
    init() {
        let clientID = "HoverRunApp"
//        let host = "10.3.141.1"
        let host = "192.168.178.77"
        let port = UInt16(1883)
        self.mqttClient = CocoaMQTT(clientID: clientID, host: host, port: port)
        self.mqttClient.username = ""
        self.mqttClient.password = ""
        self.mqttClient.keepAlive = 60
        self.mqttClient.delegate = self
        connect()
    }
    
    func connect() {
        if !self.status {
            self.mqttClient.disconnect()
            self.mqttClient.connect()
            print("Connecting....")
        }
    }
    
    func sendMessage(topic:String, message:String) {
        self.mqttClient.publish(topic, withString: message)
        print("Sent Msg: \(message)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("Connected")
        self.status = true
        self.mqttClient.subscribe("hvrrun/ack")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        self.msgAck = message.string ?? "empty"
        print("Mqtt Ack was: \(self.msgAck)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: [String]) {
        print("Did subscribe to \(topic)")
        print("\(self.status)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        self.status = false
        print("Disconnected")
    }
}
