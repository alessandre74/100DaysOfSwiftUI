//
//  TagView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 04/02/23.
//

import SwiftUI

struct TagView: View {
    let user: User
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 10).bold())
                        .frame(width: 60, height: 20)
                        .padding(4)
                        .background(.backgroundList)
                        .cornerRadius(4)
                }
            }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
