//
//  ErrorFiltersView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct ErrorFiltersView: View {
     var homeViewModel = HomeViewModel.instance

    var body: some View {
        Rectangle()
            .scaledToFill()
            .frame(height: 50)
            .foregroundStyle(.neutral300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                alignment: .leading,
                content: {
                    VStack {
                        HStack(alignment: .center) {
                            Spacer()
                            Image(systemName: "exclamationmark.circle")
                            Text("Has error occurred while load filters")
                                .fontWeight(.light)
                            Spacer()
                        }
                        Button(action: {
                            Task {
                                try await homeViewModel.getFilters()
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
    ErrorFiltersView()
}
