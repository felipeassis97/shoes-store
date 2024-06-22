//
//  PromotionalBannerItemView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import SwiftUI
import Core

struct BannerItemView: View {
    let banner: Banner
    @StateObject private var imageLoader = ImageDownloader()
    
    var body: some View {
        ZStack {
            if imageLoader.isLoading {
                BannerLoadingView()
            } else if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                   
            } else {
                BannerErrorView()
            }
        }
        .onAppear {
            Task {
                imageLoader.download(from: banner.image)
                
            }
        }
    }
}
