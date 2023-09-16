//
//  ListItensView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 02/02/23.
//

import SwiftUI

struct ListItensView: View {
    var user: User
    var body: some View {
        HStack {
            Text(Users().nameInitials(name: user.name))
                .padding()
                .background(.gray)
                .clipShape(Circle())
                .padding(6)
                .frame(width: 80)
                .overlay(
                    Circle().stroke(user.isActive ? Color.green : Color.red, lineWidth: 2)
                )
                .padding([.top, .bottom], 7)

            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)

                Text(user.isActive ? "Active" : "Inactive")
                    .font(.subheadline.bold())
                    .foregroundColor(user.isActive ? .green : .secondary)
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ListItensView_Previews: PreviewProvider {
    static var previews: some View {
        ListItensView(user: Users().loadMock())
            .background(.backgroundListItem)
            .preferredColorScheme(.dark)
    }
}
