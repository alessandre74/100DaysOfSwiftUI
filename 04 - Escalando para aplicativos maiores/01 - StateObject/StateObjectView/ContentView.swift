//
//  ContentView.swift
//  StateObjectView
//
//  Created by Alessandre Livramento on 19/10/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    var body: some View {
        VStack {
            ScreenOneView()
            ScreenTwoView()
        }
        .padding()
    }
}

struct ScreenOneView: View {
    @StateObject var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ScreenTwoView: View {
    @StateObject var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
