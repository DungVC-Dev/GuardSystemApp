//
//  AllGuardView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 30/10/2023.
//

import SwiftUI

struct AllGuardView: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        ScrollView {
            VStack {
                Text("All Guard")
                    .font(.customFontSize(font: .openSans, weight: .bold, size: 26))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.skyBlue)
                InfoCardCommonView(
                    urlImage: "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                    guardName: "KhiemPX",
                    description: "Chu lordlordlordlordlordlordlordlord",
                    rate: "5.0"
                )
                Spacer()
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

    }
}