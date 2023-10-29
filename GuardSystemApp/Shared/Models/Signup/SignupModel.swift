//
//  SignupModel.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 26/10/2023.
//

import Foundation

struct SignupRequest: Codable {
    var username: String
    var passwd: String
    var confirmpasswd: String
    var role: String
    var firstname: String
    var lastname: String
    var phone: String
}

struct SignupModel: Codable {
    var userId: Int
    var firstname: String
    var lastname: String
    var phone: String
}
