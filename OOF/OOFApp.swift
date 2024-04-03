//
//  OOFApp.swift
//  OOF
//
//  Created by 문인범 on 3/23/24.
//

import SwiftUI

@main
struct OOFApp: App {
    let persistentController = PersistentController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistentController.container.viewContext)
                .tint(.orange)
                .onAppear {
                    TripDAO.shared.getSampleData()
                }
        }
    }
}
