//
//  SignupModel.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 27/10/2023.
//

import Combine
import Foundation

class SignupViewModel: ObservableObject {
    @Published var signupModel: SignupModel?
    @Published public var alert: AlertViewObject? = nil
    private var cancellables = Set<AnyCancellable>()
    var signupProvider: SignupProvider = SignupClient()

    func signup(
        username: String,
        password: String,
        confirmpasswd: String,
        firstname: String,
        lastname: String,
        phone: String
    ) {
        let request = SignupRequest(
            username: username,
            passwd: password,
            confirmpasswd: confirmpasswd,
            role: "1",
            firstname: firstname,
            lastname: lastname,
            phone: phone
        )

        signupProvider.signup(param: request)
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
                self?.signupModel = response
            })
            .store(in: &cancellables)
    }

}
