//
//  LoginView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 18) {
            Text("Welcome")
              .font(
                Font.custom("Open Sans", size: 26)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.04, green: 0.56, blue: 0.67))

            CommonTextField(
                title: "Account",
                placeholder: "Username",
                text: $username
            )
            CommonTextField(
                title: "Password",
                placeholder: "Password",
                text: $password
            )
            ButtonStateCommon(title: "Login") {
                viewModel.login(username: username, password: password)
            }
        }
        .padding()
        .onViewAlert(with: $viewModel.alert)
    }
}
