//
//  ContentView.swift
//  DrawingImagePaintView
//
//  Created by Alessandre Livramento on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 200, height: 100)
                .foregroundColor(.white)
                .background(.red)

            Text("Hello World")
                .frame(width: 200, height: 100)
                .border(.red, width: 30)

            Text("Hello World")
                .frame(width: 300, height: 200)
                .border(ImagePaint(image: Image("ventura"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.2), scale: 0.04), width: 50)

            Capsule()
                .strokeBorder(ImagePaint(image: Image("ventura"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
