//
//  ViewsProperties.swift
//  ViewsAndModifiers
//
//  Created by Alessandre Livramento on 28/09/22.
//

import SwiftUI

//View como propriedades. Podemos aplicar os mofificadores diretamente.
struct ViewsProperties: View {
    
    //View Text como propriedade
    let motto1 = Text("View Text como propriedade")
    let motto2 = Text("View Text como propriedade")
    
    //View Text como propriedades computada.
    var motto3: some View {
        Text("View Text como propriedades computada")
    }
    
    /**
      1 - Opção com várias Views e VStack.
          No exemplo acima não poderiamos colocar mais de uma view de
          texto que daria erro pois não é aplicado automaticamente o
          @ViewBuilder então temos que colocar ao redor um Vstack.
   */
   
    var motto4: some View {
        VStack {
            Text("1 - Opção com várias Views e VStack")
            Text("1 - Opção com várias Views e VStack")
            Text("1 - Opção com várias Views e VStack")
            Text("1 - Opção com várias Views e VStack")
        }
    }
    
    /**
     2 - Opção com várias Views e Group.
    */
    var motto5: some View {
        Group {
            Text("2 - Opção com várias Views e Group")
            Text("2 - Opção com várias Views e Group")
            Text("2 - Opção com várias Views e Group")
            Text("2 - Opção com várias Views e Group")
        }
    }
    
    /**
     3 - Opção com várias Views e @ViewBuilder.
     */
   @ViewBuilder var motto6: some View {
        Group {
            Text("3 - Opção com várias Views e @ViewBuilder")
            Text("3 - Opção com várias Views e @ViewBuilder")
            Text("3 - Opção com várias Views e @ViewBuilder")
            Text("3 - Opção com várias Views e @ViewBuilder")
        }
    }
    
    

    var body: some View {
        VStack {
            
            VStack {
               
                Spacer()
                
                
                motto1
                    .foregroundColor(.red)
                
                Spacer()
                
                
                motto2
                    .foregroundColor(.blue)
                
                Spacer()
                
                
                motto3
                    .foregroundColor(.mint)
                Spacer()
               
            }
            
            
            VStack {
                
                motto4
                    .foregroundColor(.green)
                
                Spacer()
                
                
                motto5
                    .foregroundColor(.brown)
                
                
                Spacer()
                
                
                motto6
                    .foregroundColor(.cyan)
                
                Spacer()
            }
        }
    }
}




struct ViewsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsProperties()
    }
}
