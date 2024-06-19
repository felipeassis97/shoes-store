//
//  PromotionalBannerTabView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct BannerTabView: View {
    @State private var currentIndex = 1
    @StateObject private var viewModel = HomeViewModel()
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(){
            TabView(selection:$currentIndex){
                ForEach(0..<viewModel.banners.count,id: \.self) { imageIndex in
                    BannerItemView(banner: viewModel.banners[imageIndex])
                        .tag(imageIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onAppear {
            Task {
                try await viewModel.getBanners()
            }
        }
        .onReceive(timer){_ in
            if viewModel.banners.count > 0 {
                withAnimation {
                    currentIndex = (currentIndex + 1) % viewModel.banners.count
                }
            }
        }
    }
}

#Preview {
    BannerTabView()
}
