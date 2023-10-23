//
//  ContentView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 23/10/2023.
//

import SwiftUI

struct ContentView: View {
    static let username = "huynguyencong"

    var body: some View {
        NavigationView {
            RepoListCoordinator(username: Self.username)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
