//
//  AllGuardView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 30/10/2023.
//

import SwiftUI

struct AllGuardView: View {
    @StateObject var viewModel = GetAllGuardViewModel()
    @Binding var rootIsActive : Bool

    var body: some View {
        ScrollView {
            VStack {
                titleView
                if let allGuradModel = viewModel.allGuradModel {
                    makeGuardListView(allGuradModel: allGuradModel)
                    Spacer(minLength: 0)
                }
                Spacer(minLength: 0)
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button {
                    rootIsActive = false
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                }
        )
        .onAppear {
            viewModel.getAllGurad()
        }
        .onViewAlert(with: $viewModel.alert)
    }
}

extension AllGuardView {
    var titleView: some View {
        Text("All Guard")
            .font(.customFontSize(font: .openSans, weight: .bold, size: 26))
            .multilineTextAlignment(.center)
            .foregroundColor(.skyBlue)
    }

    func makeGuardListView(allGuradModel: GetAllGuardModel) -> some View {
        LazyVStack(spacing: 8) {
            ForEach(allGuradModel.guardList, id: \.id) { item in

                InfoCardCommonView(
                    urlImage: viewModel.convertDataToString(data: item.img),
                    guardName: String(item.firstname + item.lastname),
                    description: "\(item.address ?? "") + \(item.age ?? 0)",
                    rate: "5.0"
                )
                //                InfoCardCommonView(
                //                    urlImage: item.img ?? "",
                //                    guardName: String(item.firstname + item.lastname),
                //                    description: String((item.address ?? "") + (item.age ?? "")),
                //                    rate: "5.0"
                //                )
            }
        }
    }
}
