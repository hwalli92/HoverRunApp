//
//  MailManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-01-03.
//

import SwiftUI
import UIKit
import MessageUI

struct MailView: UIViewControllerRepresentable {
    

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    var workoutData: Workout
    
    
    class MailManager: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                           didFinishWith result: MFMailComposeResult,
                                           error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> MailManager {
        return MailManager(presentation: presentation,
                               result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("CSV File")
        vc.setMessageBody("", isHTML: false)
        
        let csvData: NSData = createCSV()
        vc.addAttachmentData(csvData as Data, mimeType: "text/csv", fileName:"workoutData.csv")
        
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
    
    func createCSV() -> NSData{
        var csvText = "Workout Data\n"
        
        csvText += "\nStart Date,\(workoutData.start ?? Date())\n"
        csvText += "End Date,\(workoutData.end ?? Date())\n"
        csvText += "Total Time,\(workoutData.totaltime)\n"
        csvText += "Time Stamps, \((workoutData.timestamp ?? [0]).toPrint)\n"
        csvText += "Heart Rate, \((workoutData.heartrate ?? [0]).toPrint)\n"
        csvText += "Calories, \((workoutData.calories ?? [0]).toPrint)\n"
        csvText += "Distance, \((workoutData.distance ?? [0]).toPrint)\n"
        csvText += "Pace, \((workoutData.pace ?? [0]).toPrint)\n"
        
        return csvText.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
    }
}

extension Array{
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "\(element), "
        }
        return str
    }
}
