//
//  InterfaceController.swift
//  HoverRun WatchKit Extension
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import Foundation
import WatchConnectivity

class PhoneInterface: NSObject, WCSessionDelegate{
    var session: WCSession
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sendAll(workoutStatus: String, timestamp: Int, heartrate: Double, distance: Double, calories: Double, pace: Double, start: Date, end: Date){
        print("Sending All Data")
        self.session.sendMessage(["status": workoutStatus, "timestamp": timestamp, "heartrate": heartrate, "distance": distance, "activeCalories": calories, "pace": pace, "start": start, "End": end], replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
