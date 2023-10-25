//
//  LoginRouter.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 25/10/2023.
//

import Foundation

enum LoginRouter: RequestInfoConvertible {
    case login(param: LoginRequest)


    var endpoint: String {
        "https://a79a88fa-83c6-458a-a8c9-0391fab47b0c.mock.pstmn.io"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }

    func asRequestInfo() -> RequestInfo {
        let parameters: [String: Any]
        switch self {
            case .login(let param):
            parameters = [ "username": param.username, "passwd": param.passwd]
        }

        let requestInfo =  RequestInfo(
            url: urlString,
            method: .post,
            parameters: parameters
        )

        return requestInfo
    }
}
