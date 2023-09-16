//
//  DataController.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 22/01/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
//                return
            }

            // configuração para definir o atributo nome seja exclusivo
//            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }

    static func addSinger(moc: NSManagedObjectContext) {
        let taylor = Singer(context: moc)
        taylor.firstname = "Taylor"
        taylor.lastname = "Swift"

        let ed = Singer(context: moc)
        ed.firstname = "Ed"
        ed.lastname = "Sheeran"

        let adele = Singer(context: moc)
        adele.firstname = "Adele"
        adele.lastname = "Adkins"

        try? moc.save()
    }

    static func labelFilter(filter: String, type: TypePredicade) -> String {
        let predicade = type == .beginsWith ? "start with \(filter)" : "contains \(filter)"
        return "lastname \(predicade)"
    }
}
