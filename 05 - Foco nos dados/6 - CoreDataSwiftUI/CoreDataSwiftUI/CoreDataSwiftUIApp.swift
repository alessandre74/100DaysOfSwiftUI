//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
