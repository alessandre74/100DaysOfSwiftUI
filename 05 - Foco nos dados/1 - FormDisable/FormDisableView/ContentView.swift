//
//  ContentView.swift
//  FormDisableView
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

// Validando e desabilitando formulários
struct ContentView: View {
    @State private var username = String()
    @State private var email = String()

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
