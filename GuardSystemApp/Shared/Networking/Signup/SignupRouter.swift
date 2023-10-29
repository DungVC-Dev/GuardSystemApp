//
//  SignupRouter.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 28/10/2023.
//

import Foundation
import Alamofire

enum SignupRouter: RequestInfoConvertible {
    case signup(param: SignupRequest)


    var endpoint: String {
        "http://localhost:3000"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .signup:
            return "auth/signup"
        }
    }

    func asRequestInfo() -> RequestInfo {
        let parameters: [String: Any]
        switch self {
        case .signup(let param):
            parameters = [
                "username": param.username,
                "passwd": param.passwd,
                "confirmpasswd": param.confirmpasswd,
                "role": param.role,
                "firstname": param.firstname,
                "lastname": param.lastname,
                "phone": param.phone
            ]
        }

        let requestInfo = RequestInfo(
            url: urlString,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        )

        return requestInfo
    }
}
