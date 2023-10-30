//
//  InfoCardView.swift
//  GuardSystemApp
//
//  Created by dungvc1 on 30/10/2023.
//

import SwiftUI
import Kingfisher

struct InfoCardCommonView: View {
    let urlImage: String
    let guardName: String
    let description: String
    let rate: String

    var body: some View {
        HStack(spacing: 24) {
           KFImage(URL(string: urlImage))
                .resizable()
                .aspectRatio(1.1, contentMode: .fit)

            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Text(guardName)
                        .font(.customFontSize(font: .openSans, weight: .semibold, size: 18))
                    Spacer()
                    ButtonIconCommon(
                        systemImage:"heart",
                        heightIcon: 24,
                        widthIcon: 24
                    ) {
                        // handle after
                    }
                }

                Text(description)
                    .font(.customFontSize(font: .openSans, weight: .semibold, size: 14))
                    .foregroundColor(.mediumGray)

                HStack {
                    ButtonStateCommon(
                        title: "Book",
                        customFont: .customFontSize(font: .openSans, weight: .thin, size: 14),
                        isButtonSmall: true
                    ) {
                        //handler book
                    }
                    .frame(width: 80, height: 28)

                    Spacer()

                    Text(rate)
                        .font(.customFontSize(font: .openSans, weight: .semibold, size: 16))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.yellow)
                }

            }
        }
        .padding(16)
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.lightBlueGreen)
                .cornerRadius(10)
        )
        .frame(height:  160)
    }
}
