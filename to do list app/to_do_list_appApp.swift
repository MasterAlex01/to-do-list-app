//
//  to_do_list_appApp.swift
//  to do list app
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

@main
struct to_do_list_appApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
