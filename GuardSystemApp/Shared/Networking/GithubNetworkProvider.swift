//
//  GithubNetworkProvider.swift
//  SwiftUI-MVVM-C
//

import Foundation
import Combine

protocol GithubNetworkProvider {
    func getRepos(username: String) -> AnyPublisher<[Repo], NetworkError>
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, NetworkError>
    func getUser(username: String) -> AnyPublisher<User, NetworkError>
}

class GithubNetworkClient: GithubNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getRepos(username: String) -> AnyPublisher<[Repo], NetworkError> {
        networkClient.request(GithubRouter.repos(username: username)).decode()
    }
    
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, NetworkError> {
        networkClient.request(GithubRouter.repo(username: username, name: name)).decode()
    }
    
    func getUser(username: String) -> AnyPublisher<User, NetworkError> {
        networkClient.request(GithubRouter.user(username: username)).decode()
    }
}
