//
//  LoginRequest.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation

struct LoginResponse: Codable {
    let role: Int
    let token: String
}

// LoginRequest model
struct LoginRequest: Codable {
    let username: String
    let passwd: String
}
