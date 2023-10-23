//
//  RepoListViewModel.swift
//  SwiftUI-MVVM-C
//

import Foundation

class RepoListViewModel: ObservableObject {
    @Published var repos: [Repo] = []
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    func getRepos() {
        networkClient
            .getRepos(username: "huynguyencong")
            .replaceError(with: [])
            .assign(to: &$repos)
    }
}
