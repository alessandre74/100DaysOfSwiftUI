//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 23/01/23.
//
//

import CoreData
import Foundation

extension Movie {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrapperTitle: String {
        title ?? "Unknown Title"
    }
}

extension Movie: Identifiable {
}
