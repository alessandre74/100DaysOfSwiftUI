//
//  ButtonView.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 24/01/23.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let text: String
    var image: String
    let colorTint: Color
    let disabled: Bool

    init(action: @escaping () -> Void, text: String, image: String, colorTint: Color, disabled: Bool) {
        self.action = action
        self.text = text
        self.image = image
        self.colorTint = colorTint
        self.disabled = disabled
    }

    var body: some View {
        Button(action: action) {
            Label(text, systemImage: image)
                .font(.headline)
                .frame(width: 260)
        }
        .buttonStyle(.borderedProminent)
        .tint(colorTint)
        .disabled(disabled)
        .preferredColorScheme(.dark)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            action: { },
            text: "click here",
            image: "plus.app",
            colorTint: .blue,
            disabled: false
        )
    }
}
