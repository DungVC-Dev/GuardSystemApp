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
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(isEnabled ? Color(red: 0.04, green: 0.56, blue: 0.67) : Color.gray)
                        .cornerRadius(10)
                )
                .opacity(isEnabled ? 1.0 : 0.5)
        }
        .frame(maxWidth: .infinity)
        .disabled(!isEnabled)
    }
}
