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
        VStack {
            Text("All Guard")
                .font(.customFontSize(font: .openSans, weight: .bold, size: 26))
                .multilineTextAlignment(.center)
                .foregroundColor(.skyBlue)
        }
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
