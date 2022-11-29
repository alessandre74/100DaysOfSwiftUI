//
//  ContentView.swift
//  LazyHGridLazyVGrid
//
//  Created by Alessandre Livramento on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // LazyVGridView()
        LazyHGridView()
    }
}

struct LazyVGridView: View {
    let layout = [GridItem(.adaptive(minimum: 80, maximum: 120))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0 ..< 1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct LazyHGridView: View {
    let layout = [GridItem(.adaptive(minimum: 80, maximum: 120))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0 ..< 1000) {
                    Text("Item \($0)")
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
