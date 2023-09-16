//
//  InitialsView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 04/02/23.
//

import SwiftUI

struct InitialsView: View {
    let user: User

    var body: some View {
        HStack {
            Text(Users().nameInitials(name: user.name))
                .font(.system(size: 60))
                .padding()
                .background(.gray)
                .clipShape(Circle())
                .padding(8)
                .overlay(
                    Circle().stroke(user.isActive ? Color.green : Color.red, lineWidth: 4)
                )
                .padding(6)
        }
        .padding(4)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct InitialsView_Previews: PreviewProvider {
    static var previews: some View {
        InitialsView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
