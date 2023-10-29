//
//  AppRouter.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 29/10/2023.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    static let shared = AppRouter()

    enum Route {
        case login
        case home
    }

    @Published var currentRoute: Route? = nil

    func navigate(to route: Route) {
        currentRoute = route
    }
}
