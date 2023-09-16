//
//  ListFriendsView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 04/02/23.
//

import SwiftUI

struct ListFriendsView: View {
    var user: User

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.friends) { friend in
                    VStack {
                        Text(friend.name)
                            .font(.system(size: 12).bold())
                    }
                }
                .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                .background(.backgroundList)
                .cornerRadius(4)
            }
        }
    }
}

struct ListFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        ListFriendsView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
