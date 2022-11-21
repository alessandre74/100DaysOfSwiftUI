//
//  ContentView.swift
//  CodableView
//
//  Created by Alessandre Livramento on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       CodableView()
    }
}

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct CodableView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        VStack {
            Button("Save User") {
                if let data = try? JSONEncoder().encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }

            Button("Load User") {
                if let savedUser = UserDefaults.standard.data(forKey: "UserData") {
                    let data = try? JSONDecoder().decode(User.self, from: savedUser)

                    print(data?.firstName ?? "não existe")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
