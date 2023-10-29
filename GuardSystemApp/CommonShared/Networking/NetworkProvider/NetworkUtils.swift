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

    init(underlyingError: Error) {
        self = .other(underlyingError)
    }
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

    func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, NetworkError> {
        tryMap { data -> T in
            return try jsonDecoder.decode(T.self, from: data)
        }
        .mapError { error in
            // Convert any error to NetworkError here
            return NetworkError(underlyingError: error)
        }
        .eraseToAnyPublisher()
    }
}

class ErrorHandlingUtility {
    static func handleNetworkError(_ error: Error?, completionHandler: @escaping (AlertViewObject) -> Void) {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .invalidResponse:
                completionHandler(AlertViewObject(
                    title: "Error",
                    message: "Invalid response",
                    titleSecondary: "OK"
                ))
            case .invalidInput:
                completionHandler(AlertViewObject(
                    title: "Error",
                    message: "Invalid input",
                    titleSecondary: "OK"
                ))
            case .invalidJSON:
                completionHandler(AlertViewObject(
                    title: "Error",
                    message: "Invalid JSON",
                    titleSecondary: "OK"
                ))
            case .other(let underlyingError):
                completionHandler(AlertViewObject(
                    title: "Error",
                    message: "An error occurred: \(underlyingError.localizedDescription)",
                    titleSecondary: "OK"
                ))
            }
        } else if let error = error {
            // Handle other types of errors
            completionHandler(AlertViewObject(
                title: "Error",
                message: "An error occurred: \(error.localizedDescription)",
                titleSecondary: "OK"
            ))
        }
    }
}
