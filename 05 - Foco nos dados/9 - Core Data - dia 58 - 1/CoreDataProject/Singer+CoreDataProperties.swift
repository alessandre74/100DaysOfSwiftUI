//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 23/01/23.
//
//

import CoreData
import Foundation

extension Singer {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?

    var wrapperFirstname: String {
        firstname ?? "Unknown"
    }

    var wrapperLastName: String {
        lastname ?? "Unknown"
    }
}

extension Singer: Identifiable {
}
