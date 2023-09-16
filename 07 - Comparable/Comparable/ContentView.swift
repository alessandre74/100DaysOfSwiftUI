//
//  ContentView.swift
//  Comparable
//
//  Created by Alessandre Livramento on 28/06/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
  let id = UUID()
  let firstName: String
  let lastName: String

  static func < (lhs: User, rhs: User) -> Bool {
    lhs.firstName < rhs.firstName
  }
}

struct ContentView: View {
  let users = [
    User(firstName: "Arnold", lastName: "Rimmer"),
    User(firstName: "Kristine", lastName: "Kochanski"),
    User(firstName: "David", lastName: "Lister"),
  ].sorted()

  var body: some View {
    List(users) { user in
      Text("\(user.firstName) \(user.lastName)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
