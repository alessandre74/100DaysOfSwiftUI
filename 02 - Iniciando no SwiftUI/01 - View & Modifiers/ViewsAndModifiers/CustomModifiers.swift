//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//

import SwiftUI

struct CustomModifiers: View {
    var body: some View {
        VStack {
            
            //Com isso em vigor, agora podemos adicionar uma marca d'água a qualquer visualização como esta:
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .titleStyles()
        }
        

    }
}


/**
 1° Exemplo de modifier.
 Podemos agora utilizar o modifier acima, mas podemos fazer ainda melhor com extensions.
*/
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyles() -> some View {
        modifier(Title())
    }
}


/**
2° Exemplo de modifier.
 Os modificadores personalizados podem fazer muito mais do que apenas
 aplicar outros modificadores existentes – eles também podem criar uma
 nova estrutura de visualização, conforme necessário. Lembre-se, os
 modificadores retornam novos objetos em vez de modificar os existentes,
 para que possamos criar um que incorpore a visualização em uma pilha
 e adicione outra visualização:
*/

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
