//
//  NetworkUtils.swift
//  SwiftUI-MVVM-C
//

import Foundation
import SwiftUI
import Combine

enum NetworkError: Error {
    case invalidResponse
    case invalidInput
    case invalidJSON
    case other(Error)
}

extension AnyPublisher where Output == Data, Failure == Error {
    func jsonObject() -> AnyPublisher<[String: Any], Failure> {
        tryMap { data -> [String: Any] in
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return jsonObject
            }
            
            throw NetworkError.invalidJSON
        }.eraseToAnyPublisher()
    }
    
    func jsonObjects() -> AnyPublisher<[[String: Any]], Failure> {
        tryMap { data -> [[String: Any]] in
            if let jsonObjects = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                return jsonObjects
            }
            
            throw NetworkError.invalidJSON
        }.eraseToAnyPublisher()
    }
    
    func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Failure> {
        tryMap { data -> T in
            return try jsonDecoder.decode(T.self, from: data)
        }.eraseToAnyPublisher()
    }
}

func handleNetworkError(_ error: NetworkError, showAlert: Binding<AlertViewObject?>) {
    switch error {
    case .badRequest(let detailInfo):
        showAlert.wrappedValue = AlertViewObject(
            title: "Bad Request",
            message: detailInfo ?? "An error occurred",
            titleSecondary: "OK",
            primaryButtonStyle: .normal,
            secondaryButtonStyle: .normal
        )
    case .unauthorized:
        showAlert.wrappedValue = AlertViewObject(
            title: "Unauthorized",
            message: "An error occurred: Unauthorized",
            titleSecondary: "OK",
            primaryButtonStyle: .normal,
            secondaryButtonStyle: .normal
        )
    case .forbidden(let detailInfo):
        showAlert.wrappedValue = AlertViewObject(
            title: "Forbidden",
            message: detailInfo ?? "An error occurred",
            titleSecondary: "OK",
            primaryButtonStyle: .normal,
            secondaryButtonStyle: .normal
        )
        // Add cases for other error types as needed
    default:
        showAlert.wrappedValue = AlertViewObject(
            title: "Error",
            message: "An unknown error occurred",
            titleSecondary: "OK",
            primaryButtonStyle: .normal,
            secondaryButtonStyle: .normal
        )
    }
}

