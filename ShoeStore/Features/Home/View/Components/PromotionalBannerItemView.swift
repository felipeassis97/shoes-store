//
//  PromotionalBannerItemView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import SwiftUI
import Core

struct PromotionalBannerItemView: View {
    let banner: Banner
    @StateObject private var imageLoader = DownloadImage()
    
    var body: some View {
        ZStack {
            if imageLoader.isLoading {
                           ProgressView()
                       } else if let image = imageLoader.image {
                           Image(uiImage: image)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                       } else {
                           Image(systemName: "exclamationmark.triangle.fill")
                       }
        }
        .onAppear {
            Task {
                imageLoader.download(from: banner.banner)
            }
        }
    }
}
