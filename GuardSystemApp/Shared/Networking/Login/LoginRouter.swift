//
//  LoginRouter.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation
import Alamofire

enum LoginRouter: RequestInfoConvertible {
    case login(param: LoginRequest)


    var endpoint: String {
        "http://localhost:3000"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .login:
            return "auth/login"
        }
    }

    func asRequestInfo() -> RequestInfo {
        let parameters: [String: Any]
        switch self {
            case .login(let param):
            parameters = [ "username": param.username, "passwd": param.passwd]
        }

        let requestInfo = RequestInfo(
            url: urlString,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        )
        print("VCD \(requestInfo)")
        return requestInfo
    }
}
