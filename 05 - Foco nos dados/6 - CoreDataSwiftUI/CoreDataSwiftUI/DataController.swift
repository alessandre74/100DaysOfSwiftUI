//
//  DataController.swift
//  CoreDataSwiftUI
//
//  Created by Alessandre Livramento on 12/01/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load:\(error.localizedDescription)")
            }
        }
    }
}
