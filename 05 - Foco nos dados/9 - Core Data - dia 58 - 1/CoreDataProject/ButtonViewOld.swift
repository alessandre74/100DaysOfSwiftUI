//
//  ButtonViewOld.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 25/01/23.
//

import SwiftUI

struct ButtonViewOld<Content: View>: View {
    let colorTint: Color
    let disabled: Bool

    let action: () -> Void
    let content: Content

    init(action: @escaping () -> Void, @ViewBuilder content: () -> Content, colorTint: Color, disabled: Bool) {
        self.action = action
        self.content = content()
        self.colorTint = colorTint
        self.disabled = disabled
    }

    var body: some View {
        Button(action: action) {
            content
                .font(.headline)
                .frame(width: 260)
        }
        .buttonStyle(.borderedProminent)
        .tint(colorTint)
        .disabled(disabled)
    }
}
