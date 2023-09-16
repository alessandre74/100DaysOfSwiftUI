//
//  DataController.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 22/01/23.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolve Error: \(error)")
            }
        }
    }
}
