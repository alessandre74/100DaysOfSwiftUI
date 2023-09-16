//
//  NameView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 04/02/23.
//

import SwiftUI

struct NameView: View {
    let user: User

    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(user.firstName)
                        .font(.system(size: 40).bold())

                    Text(user.lastName)
                        .font(.system(size: 40))
                        .foregroundColor(.secondary)
                }
                .frame(width: 194, alignment: .leading)

                VStack {
                    Text("age")
                        .font(.system(size: 14).bold())
                        .foregroundColor(.secondary)
                        .padding(.bottom, 1)

                    Text("\(user.age)")
                        .font(.system(size: 14).bold())
                }
                .padding(4)
            }
            .frame(width: 238, alignment: .leading)

            Divider().frame(height: 100)

            VStack(alignment: .leading) {
                Text("registered")
                    .font(.system(size: 14).bold())
                    .foregroundColor(.secondary)
                    .padding(.bottom, 1)

                HStack(alignment: .center) {
                    Text(user.month)
                        .font(.system(size: 14).bold())

                    Text(user.day)
                        .font(.system(size: 14))

                    Text(user.year)
                        .font(.system(size: 14))
                }
            }
            .padding(4)
        }
        .padding([.leading, .trailing], 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
