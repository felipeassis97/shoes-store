//
//  StoresItemView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import SwiftUI
import Core

struct StoreItemView: View {
    let store: Store
    @StateObject private var imageLoader = ImageDownloader()
    
    var body: some View {
        HStack {
            ZStack {
                if imageLoader.isLoading {
                    ProgressView()
                } else if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 64)
                    
                } else {
                    Text("Error")
                }
            }
            Text(store.name)
            //.font(.customStyle(type: .nunito, style: .regular, size: 14))
                .padding(.leading, 8)
        }
        
        
        
        .onAppear {
            Task {
                imageLoader.download(from: store.brand)
            }
        }
    }
}
//    var body: some View {
//        HStack {
//            KFImage(URL(string: orderItem.logoImage))
//                .placeholder({ _ in
//                    Circle()
//                        .scaledToFit()
//                        .foregroundStyle(.gray.opacity(0.1))
//                        .frame(width: 40, height: 40)
//                })
//                .resizable()
//                .scaledToFit()
//                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                .frame(width: 40, height: 40)
//            
//            Text(store.name)
//                //.font(.customStyle(type: .nunito, style: .regular, size: 14))
//                .padding(.leading, 4)
//        }
//    }
//}

//#Preview {
//    StoresItemView()
//}
