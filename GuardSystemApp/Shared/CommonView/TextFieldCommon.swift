//
//  TextFieldCommon.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct CommonTextFieldLogin: View {
    @State var isHidenPass = true
    var title: String
    var placeholder: String
    var text: Binding<String>
    var isTextFieldPass = false

    var body: some View {
        VStack (spacing: 18) {
            Text(title)
                .font(.customFontSize(font: .openSans, weight: .semibold, size: 20))
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .foregroundColor(.black)
                .leadingAlignment()

            if !isTextFieldPass {
                otherTextField
            } else {
                textFieldLogin
            }
        }
    }
}


private extension CommonTextFieldLogin {
    var textFieldLogin: some View {
        HStack(spacing: 12) {
            if isHidenPass {
                Text(String(repeating: "*", count: text.wrappedValue.count))
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))
            } else {
                TextField(placeholder, text: text)
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))
            }

            Spacer()

            Button {
                isHidenPass.toggle()
            } label: {
                Image(systemName: isHidenPass ? "eye.slash" : "eye")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.mediumGray)
                    .frame(width: 16, height: 16)
            }
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.semiTransparentlightGray)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color.semiTransparentMediumGray, lineWidth: 1)
                )
        )
    }

    var otherTextField: some View {
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
