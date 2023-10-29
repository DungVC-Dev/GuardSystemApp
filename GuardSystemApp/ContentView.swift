//
//  ContentView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 23/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var router = AppRouter.shared

    var body: some View {
        Group {
            if let route = router.currentRoute {
                switch route {
                case .login:
                    LoginView()
                case .home:
                    HomeView()
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        // Check if user is authenticated
                        if TokenManager.shared.isTokenValid() {
                            self.router.navigate(to: .home)
                        } else {
                            self.router.navigate(to: .login)
                        }
                    }
            }
        }
    }
}
