//
//  LoginProtocol.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation
import Combine

protocol LoginProvider {
    func getToken(param: LoginRequest) -> AnyPublisher<LoginResponse, NetworkError>
}

class LoginClient: LoginProvider {
    var networkClient: NetworkProvider = NetworkClient.instance

    func getToken(param: LoginRequest) -> AnyPublisher<LoginResponse, NetworkError> {
        networkClient.request(LoginRouter.login(param: param)).decode()
    }
}
