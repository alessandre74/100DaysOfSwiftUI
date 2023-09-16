//
//  ContentView.swift
//  SheetView
//
//  Created by Alessandre Livramento on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       OneView()
    }
}

struct OneView: View {
    @State private var ShowingSheet = false

    var body: some View {
        Button("Show Sheet"){
            ShowingSheet.toggle()
        }
        .sheet(isPresented: $ShowingSheet) {
            SecondView(name: "Mike Livramento")
        }
    }
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss"){
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
