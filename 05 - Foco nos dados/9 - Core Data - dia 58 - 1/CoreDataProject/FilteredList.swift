//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 23/01/23.
//

import CoreData
import SwiftUI

enum TypePredicade: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    var body: some View {
        List {
            Section(fetchRequest.isEmpty ? "" : "Filter with sortDescriptor/predicate") {
                ForEach(fetchRequest, id: \.self) { item in
                    self.content(item)
                }
            }
            .font(.callout)
            .textCase(.none)
        }
    }

    init(type: TypePredicade, filterKey: String, filterValue: String, sortDescriptor: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor, predicate: NSPredicate(format: "%K \(type.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

// Sem utilizar Generics
// struct FilteredList1: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrapperFirstname) \(singer.wrapperLastName)")
//        }
//    }
//
//    init(filter: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastname BEGINSWITH %@", filter))
//    }
// }
