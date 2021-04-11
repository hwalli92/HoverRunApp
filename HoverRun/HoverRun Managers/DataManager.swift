//
//  DataManager.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2021-04-11.
//

import CoreData


struct DataManager {
    static let dataManager = DataManager()
    
    let dataContainer: NSPersistentContainer
    
    init() {
        dataContainer = NSPersistentContainer(name: "HoverRun")
        
        dataContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
    
    
}
