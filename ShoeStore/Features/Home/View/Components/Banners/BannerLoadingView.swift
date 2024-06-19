//
//  BannerLoadingView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct BannerLoadingView: View {
    var body: some View {
        Rectangle()
            .scaledToFill()
            .frame(height: 160)
            .foregroundStyle(.neutral300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .blinking(duration: 0.75)
    }
}

#Preview {
    BannerLoadingView()
}



