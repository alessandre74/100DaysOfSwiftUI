//
//  ContentView.swift
//  DrawingCGAffineTransformView
//
//  Created by Alessandre Livramento on 09/11/22.
//

import SwiftUI

struct Flower: Shape {
    // Quanto mover esta pétala para longe do centro
    var petalOffset = -20.0

    // Qual a largura para fazer cada pétala
    var petalWidth = 100.0

    func path(in rect: CGRect) -> Path {
        // O caminho que conterá todas as pétalas
        var path = Path()

        // Conte de 0 até pi * 2, subindo pi/8 a cada vez
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // gire a pétala pelo valor atual do nosso loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // mova a pétala para estar no centro da nossa visão
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // crie um caminho para esta pétala usando nossas propriedades mais um Y e altura fixos
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // aplique nossa transformação de rotação/posição à pétala
            let rotatePetal = originalPetal.applying(position)

            // adicione-o ao nosso caminho principal
            path.addPath(rotatePetal)
        }

        // agora envie o caminho principal de volta
        return path
    }
}

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 1)
                .fill(.red, style: FillStyle(eoFill: true))

            Text("Offset: \(petalOffset)")
                .frame(width: 160, alignment: .leading)

            Slider(value: $petalOffset, in: -40 ... 40)
                .padding([.horizontal, .bottom])

            Text("Width: \(petalWidth)")
                .frame(width: 160, alignment: .leading)

            Slider(value: $petalWidth, in: 0 ... 100)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
