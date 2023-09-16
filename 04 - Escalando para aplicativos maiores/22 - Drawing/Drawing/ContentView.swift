//
//  ContentView.swift
//  Drawing
//
//  Created by Alessandre Livramento on 09/11/22.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY / 2))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ContentView: View {
    @State private var animeLine = true

    var body: some View {
        Arrow()
            .stroke(animeLine ? .blue : .green, style: StrokeStyle(lineWidth: animeLine ? 8 : 12, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 400)
            .onTapGesture {
                withAnimation(.linear(duration: 0.4)) {
                    animeLine.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
