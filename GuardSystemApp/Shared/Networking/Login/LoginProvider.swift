//
//  LoginProtocol.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation
import Combine

protocol LoginProtocol {
    func getToken(param: LoginRequest) -> AnyPublisher<TokenResponse, Error>
}

class LoginClient: LoginProtocol {
    var networkClient: NetworkProvider = NetworkClient.instance

    func getToken(param: LoginRequest) -> AnyPublisher<TokenResponse, Error> {
        networkClient.request(LoginRouter.login(param: param)).decode()
    }
}
