//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Alessandre Livramento on 17/07/23.
//

import SwiftUI

struct ContentView: View {
  @State private var value = 10

  var body: some View {
    VStack {
      Text("Value: \(value)")

      Button("Increment") {
        value += 1
      }

      Button("Decrement") {
        value -= 1
      }
    }
    .accessibilityElement()
    .accessibilityLabel("Value")
    .accessibilityValue(String(value))
    .accessibilityAdjustableAction { direction in
      switch direction {
      case .increment:
        value += 1
      case .decrement:
        value -= 1
      default:
        print("Not handled.")
      }
    }
  }
}

struct Accessibility1: View {
  let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096",
  ]

  let labels = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Fireworks",
  ]

  @State private var selectedPicture = Int.random(in: 0 ... 3)

  var body: some View {
    Image(pictures[selectedPicture])
      .resizable()
      .scaledToFit()
      .onTapGesture {
        selectedPicture = Int.random(in: 0 ... 3)
      }
      .accessibilityLabel(labels[selectedPicture])
      .accessibilityAddTraits(.isButton)
      .accessibilityRemoveTraits(.isImage)
  }
}

struct Accessibility2: View {
  var body: some View {
    Image(decorative: "ales-krivec-15949")
      .accessibilityHidden(true)
  }
}

struct Accessibility3: View {
  var body: some View {
    VStack {
      Text("Your score is")
      Text("1000")
        .font(.title)
    }

    .accessibilityElement()
    .accessibilityLabel("Your scrore is 1000")

    // .ignore é o parâmetro padrão para children, então você pode obter os mesmos resultados .accessibilityElement(children: .ignore)apenas dizendo .accessibilityElement().

    // .accessibilityElement(children: .combine)  Combina a leitura dos textos

    // Vale a pena tentar ambos para ver como eles diferem na prática. Usando .combine adiciona uma pausa entre os dois pedaços de texto, porque eles não são necessariamente projetados para serem lidos juntos. Usar .ignoree um rótulo personalizado significa que o texto é lido de uma só vez e é muito mais natural.
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
