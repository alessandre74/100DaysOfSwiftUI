//
//  ContentView.swift
//  AppleStorageView
//
//  Created by Alessandre Livramento on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppleStorageView()
    }
}

struct AppleStorageView: View {
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
