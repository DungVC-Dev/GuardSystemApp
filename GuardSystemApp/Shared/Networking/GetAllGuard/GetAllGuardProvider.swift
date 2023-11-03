//
//  GetAllGuard.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 03/11/2023.
//

import Foundation
import Combine

protocol GetAllGuardProvider {
    func getAllGuard() -> AnyPublisher<GetAllGuardModel, NetworkError>
}

class GetAllGuardClient: GetAllGuardProvider {
    var networkClient: NetworkProvider = NetworkClient.instance

    func getAllGuard() -> AnyPublisher<GetAllGuardModel, NetworkError> {
        networkClient.request(GetAllGuardRouter.getAllGuard).decode()
    }
}
