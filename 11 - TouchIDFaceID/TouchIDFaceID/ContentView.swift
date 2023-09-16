//
//  ContentView.swift
//  TouchIDFaceID
//
//  Created by Alessandre Livramento on 30/06/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
  @State private var isUnlocked = false

  var body: some View {
    VStack {
      if isUnlocked {
        Text("Unlocked")
      } else {
        Text("Locked")
      }
    }
    .onAppear(perform: authenticate)
  }

  func authenticate() {
    let context = LAContext()
    var error: NSError?

    // verifique se a autenticação biométrica é possível
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      // é possível, então vá em frente e use
      let reason = "We need to unlock your data."

      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
        // a autenticação foi concluída

        if success {
          isUnlocked = true
        } else {
          // havia um problema
        }
      }
    } else {
      // sem biometria
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
