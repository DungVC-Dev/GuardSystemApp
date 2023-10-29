//
//  SignupProvider.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 28/10/2023.
//

import Foundation
import Combine

protocol SignupProvider {
    func signup(param: SignupRequest) -> AnyPublisher<SignupModel, NetworkError>
}

class SignupClient: SignupProvider {
    var networkClient: NetworkProvider = NetworkClient.instance

    func signup(param: SignupRequest) -> AnyPublisher<SignupModel, NetworkError> {
        networkClient.request(SignupRouter.signup(param: param)).decode()
    }
}
