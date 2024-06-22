//
//  BannerErrorView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct BannerErrorView: View {
     var homeViewModel = HomeViewModel.instance

    var body: some View {
        Rectangle()
            .scaledToFill()
            .frame(height: 160)
            .foregroundStyle(.neutral300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                alignment: .leading,
                content: {
                    VStack {
                        HStack(alignment: .center) {
                            Spacer()
                            Image(systemName: "exclamationmark.circle")
                            Text("Has error occurred")
                                .fontWeight(.light)
                            Spacer()
                        }
                        Button(action: {
                            Task {
                                try await homeViewModel.getBanners()
                            }
                        }, label: {
                            Text("Try again")
                                .bold()
                        })
                    }
                })
    }
}

#Preview {
    BannerErrorView()
}
