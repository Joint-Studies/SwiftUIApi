//
//  swiftUIApiApp.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import SwiftUI
import CoreData

@main
struct swiftUIApiApp: App {
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
