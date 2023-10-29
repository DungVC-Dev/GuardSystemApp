//
//  LoginView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var isAction = false
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 18) {
            EmptyNavigationLink(destination: SignupView(), isActive: $isAction)
            Text("Welcome")
                .font(.customFontSize(font: .openSans, weight: .bold, size: 26))
              .multilineTextAlignment(.center)
              .foregroundColor(.skyBlue)
            Spacer()
            CommonTextFieldLogin(
                title: "Account",
                placeholder: "Enter Your Account",
                text: $username
            )
            CommonTextFieldLogin(
                title: "Password",
                placeholder: "Enter Your Password",
                text: $password
            )
            Spacer()
            ButtonStateCommon(title: "Login") {
                viewModel.login(username: username, password: password)
            }
            Text("OR")
                .font(.customFontSize(font: .averiaSansLibre, weight: .bold, size: 22))
                .multilineTextAlignment(.center)
                .foregroundColor(.mediumGray)

            HStack(spacing: 4) {
                Text("Don’t have an account?")
                    .font(.customFontSize(font: .openSans, weight: .bold, size: 16))
                    .foregroundColor(.mediumGray)
                Text("Sign Up")
                    .font(.customFontSize(font: .openSans, weight: .bold, size: 16))
                    .foregroundColor(.skyBlue)
                    .onTapGesture {
                        isAction = true
                    }
            }
        }
        .padding()
        .onViewAlert(with: $viewModel.alert)
    }
}
