//
//  ListItemsView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct ListItemsView: View {
    var item: Habit

    var body: some View {
        NavigationLink(value: item) {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title.bold())

                Text(item.description)
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(.dark)
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView(item: Habit(title: "Academia", description: "Academia as 10:00hs"))
//            .preferredColorScheme(.dark)
    }
}
