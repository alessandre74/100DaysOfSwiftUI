//
//  ListAll.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 24/01/23.
//

import SwiftUI

// lista todos os items ordernado por firstname
struct ListAll: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.firstname)]) var singers: FetchedResults<Singer>
    var isTitle = true

    var body: some View {
        List {
            Section(singers.isEmpty ? "" : "List all items") {
                ForEach(singers, id: \.self) { singer in
                    Text("\(singer.wrapperFirstname) \(singer.wrapperLastName)")
                }
            }
            .font(.callout)
            .textCase(.none)
        }
        .preferredColorScheme(.dark)
    }
}

struct ListAll_Previews: PreviewProvider {
    static var previews: some View {
        ListAll()
    }
}
