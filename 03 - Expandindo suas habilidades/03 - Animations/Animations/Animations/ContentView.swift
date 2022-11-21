//
//  ContentView.swift
//  Animations
//
//  Created by Alessandre Livramento on 09/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AnimationView3()
    }
}

struct AnimationView1: View {

    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me"){
            if animationAmount == 3 {
                animationAmount = 1.0
            } else {
                animationAmount += 1
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false)
                    , value: animationAmount)

        )

        .onAppear {
            animationAmount = 2
        }

        //            .scaleEffect(animationAmount)
        //        .blur(radius: (animationAmount - 1) * 3)
        //        .animation(.easeOut, value: animationAmount)
        //        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        //        .animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
        //            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)

    }
}

struct AnimationView2: View {

    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)

        return VStack {

            Spacer()

            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)

            Spacer()
        }
    }
}

struct AnimationView3: View {

    @State private var animationAmount = false

    var body: some View {
        print(animationAmount)

        return Button("Tap Me"){

            withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)) {
                animationAmount.toggle()
            }

        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount ? 360: 0), axis: (x: 0, y: 1, z: 0))
    }
}

struct AnimationView4: View {

    @State private var enabled = false

    var body: some View {
        Button("Tap Me"){
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationView5: View {
    @State private var dragAmount = CGSize.zero

    @State private var value = CGSize.zero

    var body: some View {

        VStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged {
                            dragAmount = $0.translation
                            print("Localização: \(dragAmount)")
                        }
                        .onEnded {result in
                            //Animação explicita
                            withAnimation (.spring()) {

                                dragAmount = .zero
                                print("Localização inicial: \(dragAmount)")
                            }
                        }
                )
            //            .animation(.spring(), value: dragAmount) // animação implicíta
        }


    }
}

struct AnimationView6: View {
    let letters = Array("Hello SwiftUI")
    @State private var enable = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self){num in

                    if String(letters[num]) != " " {
                        Text(String(letters[num]))
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .frame(width: 22)
                            .background(enable ? .blue : .red)
                            .cornerRadius(5)
                            .offset(dragAmount)
                            .animation(.default.delay(Double(num) / 20), value: dragAmount)
                    }

                    Spacer().frame(width: 8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded {_ in
                        dragAmount = .zero
                        enable.toggle()
                    }
            )
        }
    }
}

struct AnimationView7: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct AnimationView8: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)


            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
