//
//  ContentView.swift
//  Binding
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

// Criando um componente personalizado com @Binding
struct ContentView: View {
    @State private var remembeME = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $remembeME)
            Text(remembeME ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
