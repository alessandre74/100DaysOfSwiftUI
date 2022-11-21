//
//  ContentView.swift
//  ScrollView
//
//  Created by Alessandre Livramento on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView (.horizontal) {
                LazyHStack (spacing: 10) {
                    ForEach(0..<100) {
                        CustomText("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
    }
}

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creatting a new CustomText - \(text)")
        self.text = text
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
