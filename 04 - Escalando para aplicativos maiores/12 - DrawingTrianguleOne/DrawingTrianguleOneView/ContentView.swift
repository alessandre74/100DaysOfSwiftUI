//
//  ContentView.swift
//  DrawingTrianguleOneView
//
//  Created by Alessandre Livramento on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 160, y: 0))
                path.addLine(to: CGPoint(x: 280, y: 0))
                path.addLine(to: CGPoint(x: 340, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 160, y: 0))
            }

            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(height: 100)

            Path { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 240))
                path.addLine(to: CGPoint(x: 100, y: 240))
                path.addLine(to: CGPoint(x: 100, y: 100))
                path.closeSubpath()
            }
            .stroke(.blue, lineWidth: 10)
            .frame(height: 200)

            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 260))
                path.addLine(to: CGPoint(x: 300, y: 260))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(height: 180)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
