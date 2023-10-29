//
//  SignupView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 27/10/2023.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @State var isAction = false
    @State private var username = ""
    @State private var password = ""
    @State private var rePassword = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var firstName = ""
    @State private var lastName = ""

    var body: some View {
        VStack(spacing: 12) {
            EmptyNavigationLink(destination: LoginView(), isActive: $isAction)
            Text("Create New Account")
                .font(.customFontSize(font: .openSans, weight: .bold, size: 26))
                .multilineTextAlignment(.center)
                .foregroundColor(.skyBlue)
            Spacer()
            HStack(spacing: 12) {
                CommonTextFieldLogin(
                    title: "First Name",
                    placeholder: "Enter Your First Name",
                    text: $firstName
                )
                CommonTextFieldLogin(
                    title: "Last Name",
                    placeholder: "Enter Your Last Name",
                    text: $lastName
                )
            }
            CommonTextFieldLogin(
                title: "Account",
                placeholder: "Enter Your Account",
                text: $username
            )
            inputPassword

            Spacer()
            buttonSignup

        }
        .padding()
        .navigationBarBackButtonHidden()
        .onViewAlert(with: $viewModel.alert)
    }
}

private extension SignupView {

    @ViewBuilder
    var buttonSignup: some View {
        ButtonStateCommon(title: "Signup") {
            viewModel.signup(
                username: username,
                password: password,
                confirmpasswd: rePassword,
                firstname: firstName,
                lastname: lastName,
                phone: phone
            )
        }

        Text("OR")
            .font(.customFontSize(font: .averiaSansLibre, weight: .bold, size: 22))
            .multilineTextAlignment(.center)
            .foregroundColor(.mediumGray)

        HStack(spacing: 4) {
            Text("Already an account?")
                .font(.customFontSize(font: .openSans, weight: .bold, size: 16))
                .foregroundColor(.mediumGray)
            Text("Login")
                .font(.customFontSize(font: .openSans, weight: .bold, size: 16))
                .foregroundColor(.skyBlue)
                .onTapGesture {
                    isAction = true
                }
        }
    }

    @ViewBuilder
    var inputPassword: some View {
        HStack(spacing: 12) {
            CommonTextFieldLogin(
                title: "Password",
                placeholder: "Enter Your Password",
                text: $password
            )
            CommonTextFieldLogin(
                title: "Confirm Password",
                placeholder: "Enter Your Confirm Password",
                text: $rePassword
            )
        }

        CommonTextFieldLogin(
            title: "Email",
            placeholder: "Enter Your Email",
            text: $email
        )

        CommonTextFieldLogin(
            title: "Phone Number",
            placeholder: "Enter Your Phone Number",
            text: $phone
        )
    }
}
