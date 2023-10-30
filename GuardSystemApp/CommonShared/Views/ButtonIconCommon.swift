//
//  ButtonIconCommon.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 30/10/2023.
//

import SwiftUI

struct ButtonIconCommon: View {
    var isEnabled: Bool = true
    var foregroundColor: Color?
    var image: String?
    var systemImage: String?
    var heightIcon: CGFloat
    var widthIcon: CGFloat

    var action: () -> Void

    var body: some View {
        if systemImage != nil {
            Button(action: action) {
                Image(systemName: systemImage ?? "")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(foregroundColor)
                    .frame(width: widthIcon, height: heightIcon)
            }
            .disabled(!isEnabled)
        } else {
            Button(action: action) {
                Image(image ?? "", bundle: .main)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(foregroundColor)
                    .frame(width: widthIcon, height: heightIcon)
            }
            .disabled(!isEnabled)
        }
    }
}
