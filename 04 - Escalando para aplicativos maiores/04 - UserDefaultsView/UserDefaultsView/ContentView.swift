//
//  ContentView.swift
//  UserDefaultsView
//
//  Created by Alessandre Livramento on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UserDefaultsView()
    }
}

struct UserDefaultsView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    var body: some View {
        Button("Tap Count \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
