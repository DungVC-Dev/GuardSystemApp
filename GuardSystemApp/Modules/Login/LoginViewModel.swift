//
//  LoginViewModel.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var token = TokenResponse(token: "")
    @Published public var alert: AlertViewObject? = nil
    private var cancellables = Set<AnyCancellable>()
    var loginProvider: LoginProvider = LoginClient()

    func login(username: String, password: String) {
        let request = LoginRequest(username: username, passwd: password)
        loginProvider.getToken(param: request)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    ErrorHandlingUtility.handleNetworkError(error) { alertView in
                        self.alert = alertView
                    }
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.token = response
            })
            .store(in: &cancellables)
    }
}
