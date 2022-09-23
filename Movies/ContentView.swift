//
//  ContentView.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
            PopularView()
                .tabItem {
                    Label("Popular", systemImage: "list.dash")
                }
            
            TopRatedView()
                .tabItem {
                    Label("Top Rated", systemImage: "square.and.pencil")
                }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
