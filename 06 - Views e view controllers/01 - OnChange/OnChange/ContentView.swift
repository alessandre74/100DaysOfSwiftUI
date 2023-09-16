//
//  ContentView.swift
//  OnChange
//
//  Created by Alessandre Livramento on 14/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0

    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0 ... 20)
                .onChange(of: blurAmount) { _ in
                    print("New value is \(blurAmount)")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
