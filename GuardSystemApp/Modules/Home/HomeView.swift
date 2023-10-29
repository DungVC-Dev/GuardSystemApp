//
//  HomeView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 29/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 0
    @State var searchText = ""

    var body: some View {
        TabView(selection: $selectedTab) {
            makeHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                }
                .tag(0)

            calenderView()
                .tabItem {
                    Image(systemName: "calendar")
                        .frame(width: 24, height: 24)
                }
                .tag(1)
            messagerView()
                .tabItem {
                    Image(systemName: "message.fill")
                        .frame(width: 24, height: 24)
                }
                .tag(2)
            aboutView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .frame(width: 24, height: 24)
                }
                .tag(3)
        }
        .accentColor(.mixBlueGreen)
    }
}

// MARK: Home View
private extension HomeView {
    func makeHomeView() -> some View {
        VStack(spacing: 30) {
            makeTopOfHomeView
            searchUser
            NewsView()
            Spacer()
            EmptyView()
        }
        .padding()
    }

    @ViewBuilder
    var makeTopOfHomeView: some View {
        HStack(spacing: 12) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 70, height: 70)
                .background(
                    Image("PATH_TO_IMAGE")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                )
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(70)
            VStack(alignment: .leading, spacing: 0) {
                Text("Hi,Welcome Back,")
                    .font(.customFontSize(font: .openSans, weight: .thin, size: 14))
                    .foregroundColor(.mediumGray)
                Text("Công Dũng")
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 18))
                    .foregroundColor(.black)
            }
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)

        }
    }

    @ViewBuilder
    var searchUser: some View {
        HStack(spacing: 12) {
            Button {
                // handler search user
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.mediumGray)
                    .frame(width: 16, height: 16)
            }

            TextField("Search the guard", text: $searchText)
                .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))

            Spacer()

            Button {
                // handler search user
            } label: {
                Image(systemName: "mic")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.mediumGray)
                    .frame(width: 16, height: 16)
            }
        }
        .padding(16)
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.semiTransparentlightGray)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color.semiTransparentMediumGray, lineWidth: 1)
                )
        )
    }

}

private extension HomeView {
    func calenderView() -> some View {
        VStack {
            Text("calendar")
        }
    }

    func messagerView() -> some View {
        VStack {
            Text("messager")
        }
    }

    func aboutView() -> some View {
        VStack {
            Text("hello")
        }
    }

}
