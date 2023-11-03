//
//  GetAllGuardRouter.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 03/11/2023.
//

import Foundation
import Alamofire

enum GetAllGuardRouter: RequestInfoConvertible {
    case getAllGuard


    var endpoint: String {
        "http://localhost:3000"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .getAllGuard:
            return "customer/getAllGuard"
        }
    }

    func asRequestInfo() -> RequestInfo {
        return RequestInfo(
            url: urlString,
            method: .get
        )
    }
}
