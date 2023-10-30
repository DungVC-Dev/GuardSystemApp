//
//  ButtonStateCommon.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct ButtonStateCommon: View {
    var title: String
    var isEnabled: Bool = true
    var customFont: Font = .customFontSize(font: .openSans, weight: .bold, size: 22)
    var isButtonSmall = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(customFont)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.vertical, isButtonSmall ? 6 : 20)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(isEnabled ? Color.GreenBlue : Color.gray)
                        .cornerRadius(10)
                )
                .opacity(isEnabled ? 1.0 : 0.5)
        }
        .disabled(!isEnabled)
    }
}
