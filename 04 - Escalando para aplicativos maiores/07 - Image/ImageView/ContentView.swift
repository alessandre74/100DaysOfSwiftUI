//
//  ContentView.swift
//  ImageView
//
//  Created by Alessandre Livramento on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image1View()
            Image2View()
        }
        .padding()
    }
}

struct Image1View: View {
    var body: some View {
        Image("mac")
            .resizable()
            .scaledToFit()
//            .scaledToFill()
            .cornerRadius(6)
            .frame(width: 300, height: 300)
//            .clipped()
    }
}

struct Image2View: View {
    var body: some View {
        GeometryReader { geo in
            Image("screen")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .cornerRadius(6)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
