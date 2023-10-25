//
//  LoginView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
            SecureField("Password", text: $password)
                .padding()

            Button("Login") {
                loginViewModel.login(username: username, password: password)
            }
            .padding()

            Text("Token: \(loginViewModel.token.token)")
                .padding()
        }
        .padding()
    }
}
