//
//  ContentView.swift
//  BlurBlendingView
//
//  Created by Alessandre Livramento on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0

    var body: some View {
        // BlurBlendingView1()
        // BlurBlendingView2() // Utilizando colorMultiply não precisa do ZStack
        // BlurBlendingView3()
        BlurBlendingView4()
    }
}

struct BlurBlendingView1: View {
    var body: some View {
        ZStack {
            Image("mike")
                .resizable()
                .scaledToFit()

            Rectangle()
                .fill(.blue)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct BlurBlendingView2: View {
    var body: some View {
        Image("mike")
            .resizable()
            .scaledToFit()
            .colorMultiply(.cyan)
    }
}

struct BlurBlendingView3: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
            Text("\(amount)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct BlurBlendingView4: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            ZStack {
                Image("mike")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 400, height: 400)
                    .saturation(amount)
                    .blur(radius: (1 - amount) * 20)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
