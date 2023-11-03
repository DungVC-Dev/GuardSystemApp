//
//  GetAllGuardModel.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 03/11/2023.
//

import Foundation

struct GetAllGuardModel: Identifiable, Decodable {
    var id = UUID().uuidString
    var guardList: [GuardInfor]
}

extension GetAllGuardModel {
    struct GuardInfor: Decodable, Identifiable {
        var id = UUID().uuidString

        var guardId: Int?
        var userId: Int
        var firstName: String?
        var lastName: String?
        var age: Int?
        var phone: String?
        var address: String?
        var img: Data?
        var salary: Decimal?
    }
}
