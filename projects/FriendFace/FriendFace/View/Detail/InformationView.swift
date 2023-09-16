//
//  InformationView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 04/02/23.
//

import SwiftUI

struct InformationView: View {
    let user: User

    var body: some View {
        List {
            Section("Company") {
                Text(user.company)
                    .font(.system(size: 12).bold())
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)

            Section("Email") {
                Text(user.email)
                    .font(.system(size: 12).bold())
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)

            Section("Address") {
                Text(user.address)
                    .font(.system(size: 12).bold())
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)

            Section("About") {
                Text(user.about)
                    .font(.system(size: 12).bold())
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)

            Section("Tags") {
                TagView(user: user)
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)

            Section("Friends") {
                ListFriendsView(user: user)
                    .listRowBackground(Color.backgroundListItem)
            }
            .textCase(nil)
        }
        .scrollContentBackground(.hidden)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
