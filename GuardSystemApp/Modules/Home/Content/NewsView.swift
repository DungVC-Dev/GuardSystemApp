//
//  NewsView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 29/10/2023.
//

import SwiftUI

struct NewsView: View {
    @State private var currentPage = 0
    let pageCount = 3

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<pageCount, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.mixBlueGreen)
                            .frame(width: UIScreen.main.bounds.width - 32)
                    }
                }
                .contentShape(Rectangle())
                .frame(height: 200)
                .offset(x: CGFloat(currentPage) * (-UIScreen.main.bounds.width + 32))
                .animation(.easeInOut(duration: 0.3))
                .gesture(
                    DragGesture().onEnded { value in
                        let change = value.translation.width / UIScreen.main.bounds.width
                        let newPage = (CGFloat(currentPage) - change).rounded()
                        currentPage = min(max(Int(newPage), 0), pageCount - 1)

                        if currentPage == pageCount - 1 {
                            // Snap to the end of the page
                            withAnimation {
                                currentPage = pageCount - 1
                            }
                        }
                    }
                )
            }

            PageControl(numberOfPages: pageCount, currentPage: $currentPage)
        }
    }
}


struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(index == currentPage ? Color.mixBlueGreen : Color.gray)
                    .onTapGesture {
                        withAnimation {
                            currentPage = index
                        }
                    }
            }
        }
        .padding(.top, 8)
    }
}
