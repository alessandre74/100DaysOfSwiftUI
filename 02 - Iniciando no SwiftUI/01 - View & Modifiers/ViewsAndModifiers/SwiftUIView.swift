//
//  SwiftUIView.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//
 
/**
 O que está por trás da visualização principal do SwiftUI? Nada, devemos fazer com que a
 View atual ocupe mais espaço. Confrome abaixo com frame.
*/

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
