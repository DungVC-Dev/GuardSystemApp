//
//  GetAllGuardViewModel.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 03/11/2023.
//

import Combine
import Foundation

class GetAllGuardViewModel: ObservableObject {
    @Published public var alert: AlertViewObject? = nil
    var allGuradModel: GetAllGuardModel?
    let getAllGuradClient: GetAllGuardProvider = GetAllGuardClient()

    private var cancellables = Set<AnyCancellable>()

    func getAllGurad() {
      getAllGuradClient.getAllGuard()
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
                self?.allGuradModel?.guardList = response.guardList
            })
            .store(in: &cancellables)
    }

    func convertDataToString(data: Data) -> String? {
        return String(data: data, encoding: .utf8)
    }
}
