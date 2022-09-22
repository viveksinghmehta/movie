//
//  MoviesApp.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import SwiftUI

@main
struct MoviesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
