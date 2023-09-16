//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 23/01/23.
//
//

import CoreData
import Foundation

extension Candy {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

extension Candy: Identifiable {
}
