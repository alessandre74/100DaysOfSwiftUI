//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//

/**
 Podemos aplicar um modificador direto na Vstack onde todos os elemento internos sofreram a alteração.
 No exemplo abaixo utilizamos o modificador .fonte pois é um modificador de ambiente, sendo assim na sefunda
 Vstack utilizamos o fonte para fazer uma modificação em um elemento interno e como .font é um modificador de
 ambiente esse elemento interno será modificado pois o filho terá prioridade. Já na terceira VStack não
 acontecerá o mesmo pois .blur é um modificador regular.
*/


import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            VStack {
                Text("Gryffindor")
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            Spacer()
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            
            Spacer()
            
            VStack {
                Text("Gryffindor")
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
            
        }
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
