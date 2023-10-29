//
//  ButtonStateCommon.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct ButtonStateCommon: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool = true

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(
                    Font.custom("Open Sans", size: 22)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(isEnabled ? Color.mixBlueGreen : Color.gray)
                        .cornerRadius(10)
                )
                .opacity(isEnabled ? 1.0 : 0.5)
        }
        .disabled(!isEnabled)
    }
}
