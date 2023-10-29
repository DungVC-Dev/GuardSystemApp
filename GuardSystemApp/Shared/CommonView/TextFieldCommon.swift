//
//  TextFieldCommon.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct CommonTextFieldLogin: View {
    var title: String
    var placeholder: String
    var text: Binding<String>

    var body: some View {
        VStack (spacing: 18) {
            HStack {
                Text(title)
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 20))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(.black)
                Spacer()
            }

            TextField(placeholder, text: text)
                .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.3))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.52, green: 0.52, blue: 0.52).opacity(0.3), lineWidth: 1)
                        )
                )
        }
    }
}
