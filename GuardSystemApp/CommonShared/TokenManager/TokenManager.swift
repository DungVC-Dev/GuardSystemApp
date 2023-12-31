//
//  TokenManager.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 29/10/2023.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()

    private var authToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "AuthToken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AuthToken")
        }
    }

    func setToken(_ token: String) {
        authToken = token
    }

    func getToken() -> String? {
        return authToken
    }

    func clearToken() {
        authToken = nil
    }

    func isTokenValid() -> Bool {
        return authToken != nil
    }
}
