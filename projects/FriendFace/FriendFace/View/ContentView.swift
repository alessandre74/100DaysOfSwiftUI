//
//  ContentView.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(users) { user in
                        NavigationLink {
                            DetailView(user: user)
                        } label: {
                            ListItensView(user: user)
                        }
                    }
                    .forEachModifier()
                }
                .listModifier()
                .task {
                    if let data = await Users().loadData() {
                        users = data
                    }
                }
            }
        }
        .background(.backgroundList)
        .preferredColorScheme(.dark)
    }
}

struct ForEachModiFier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.backgroundListItem).shadow(color: .black.opacity(0.6), radius: 8, x: 2, y: 2))
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 10, leading: 6, bottom: 8, trailing: 6))
    }
}

struct ListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("Friend Face")
            .navigationBarBackButtonHidden(false)
            .listStyle(.plain)
            .background(.backgroundList)
            .preferredColorScheme(.dark)
    }
}

extension View {
    func forEachModifier() -> some View {
        modifier(ForEachModiFier())
    }

    func listModifier() -> some View {
        modifier(ListModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
