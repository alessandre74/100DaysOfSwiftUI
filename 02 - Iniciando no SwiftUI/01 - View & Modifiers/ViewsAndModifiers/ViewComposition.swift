//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//

import SwiftUI

struct ViewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            
            Spacer()
            
            //Fazendo o mesmo que acima, porém com View Personalizadas
            
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
            }
            
            Spacer()
            
        }
    }
}


/**
 Como as visualizações de texto acima são idênticas, exceto pelo texto, podemos envolvê-las
 em uma nova visualização personalizada, assim:
 Podemos também remover o modificador foregroundColor() e aplicar diretamente na View personalizada,
 pesonalizando ainda mais.
 */

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}


struct ViewComposition_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}
