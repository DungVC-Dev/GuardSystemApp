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
    @State var isHidenPass = false
    @State private var username = "Vcd"
    @State private var password = "123"

    var body: some View {
        NavigationView {
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
                    text: $password,
                    isTextFieldPass: true
                )

                Text("Forget Password")
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))
                    .foregroundColor(.black)
                    .trailingAlignment()
                    .onTapGesture {
                        // Handler Forget Password
                    }

                Spacer()
                buttonLogin

            }
            .padding(16)
        }
        .navigationBarBackButtonHidden()
        .onViewAlert(with: $viewModel.alert)
    }
}

private extension LoginView {

    @ViewBuilder
    var buttonLogin: some View {
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
}
