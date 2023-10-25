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
    private var cancellables = Set<AnyCancellable>()

    func login(username: String, password: String) {
        let request = LoginRequest(username: username, passwd: password)
        if let url = URL(string: "http://localhost:3000/auth/login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

            if let requestBody = try? JSONEncoder().encode(request) {
                urlRequest.httpBody = requestBody

                URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .map { $0.data }
                    .decode(type: TokenResponse.self, decoder: JSONDecoder())
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            print("Error: \(error)")
                            // Display an error message to the user
                        case .finished:
                            break
                        }
                    }, receiveValue: { [weak self] response in
                        self?.token = response
                    })
                    .store(in: &cancellables)
            } else {
                print("Error encoding request body")
            }
        } else {
            print("Invalid URL")
        }
    }

    func login1() {
        
    }
}
