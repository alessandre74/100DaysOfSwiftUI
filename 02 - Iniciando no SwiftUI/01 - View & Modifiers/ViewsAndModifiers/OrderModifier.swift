//
//  OrderModifier.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//


/**
 Conforme abaixo o espaçamento do button será menor de colocar frame depois de backgroud, pois se o background
 vir antes ele está aplicando a cor primeiro e só depois o frame aumenta o espaçamento.
*/

import SwiftUI

struct OrderModifier: View {
    var body: some View {
        
        VStack {
            Button("Hello, world!") {
                // do nothing
            }
            .frame(width: 200, height: 200)
            .background(.red)
            
            
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
    }
}

struct OrderModifier_Previews: PreviewProvider {
    static var previews: some View {
        OrderModifier()
    }
}
