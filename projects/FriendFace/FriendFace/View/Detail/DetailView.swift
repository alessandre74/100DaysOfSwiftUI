//
//  DetailView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 02/02/23.
//

import SwiftUI

struct DetailView: View {
    let user: User
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            InitialsView(user: user)
            NameView(user: user)
            InformationView(user: user)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .background(.backgroundList)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: Users().loadMock())
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}
