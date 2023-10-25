//
//  LoginRequest.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation

struct TokenResponse: Codable {
    let token: String
}

// LoginRequest model
struct LoginRequest: Encodable {
    let username: String
    let passwd: String
}
