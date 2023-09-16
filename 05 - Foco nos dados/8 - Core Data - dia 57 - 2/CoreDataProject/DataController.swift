//
//  DataController.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 22/01/23.
//

import CoreData

class DataController {
    let container = NSPersistentContainer(name: "CoreDataProject")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }

            // configuração para definir o atributo nome seja exclusivo
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
