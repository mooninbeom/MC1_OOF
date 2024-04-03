//
//  PersistentController.swift
//  OOF
//
//  Created by 문인범 on 3/23/24.
//

import UIKit
import CoreData
import MapKit





struct PersistentController {
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unsolved Error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}



