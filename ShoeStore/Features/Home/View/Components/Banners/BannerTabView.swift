//
//  PromotionalBannerTabView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct BannerTabView: View {
    @State private var currentIndex = 1
     var homeViewModel = HomeViewModel.instance
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(){
            TabView(selection:$currentIndex){
                ForEach(0..<homeViewModel.banners.count,id: \.self) { imageIndex in
                    BannerItemView(banner: homeViewModel.banners[imageIndex])
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
                try await homeViewModel.getBanners()
            }
        }
        .onReceive(timer){_ in
            if homeViewModel.banners.count > 0 {
                withAnimation {
                    currentIndex = (currentIndex + 1) % homeViewModel.banners.count
                }
            }
        }
    }
}

#Preview {
    BannerTabView()
}
