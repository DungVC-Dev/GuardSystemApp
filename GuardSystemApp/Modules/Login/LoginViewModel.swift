//
//  LoginViewModel.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published public var alert: AlertViewObject? = nil
    var loginModel: LoginResponse?
    var loginProvider: LoginProvider = LoginClient()
    private var cancellables = Set<AnyCancellable>()

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
                TokenManager.shared.setToken(response.token)
                AppRouter.shared.navigate(to: .home)
                self?.loginModel = response
            })
            .store(in: &cancellables)
    }
}
