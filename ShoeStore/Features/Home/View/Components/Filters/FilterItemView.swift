//
//  FilterItem.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI
import Core

struct FilterItemView: View {
    @StateObject private var imageLoader = ImageDownloader()
    var homeViewModel = HomeViewModel.instance
    let filter: Filter
    var isSelected: Bool {
        return filter.id == homeViewModel.currentFilter?.id
    }
    
    var body: some View {
        ZStack {
            if imageLoader.isLoading {
                ProgressView()
            } else if let image = imageLoader.image {
                
                HStack(spacing: 4) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 12)
                        .padding(.horizontal, 8)
        
                    Text(filter.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle( .black.opacity(0.7))
                        .lineLimit(1)
                }
                .padding(.vertical, 4)
                .padding(.leading, 4)
                .padding(.trailing, 10)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? .black.opacity(0.7) : .gray,
                                lineWidth: isSelected ? 1.5 : 0.5)
                        .shadow(color: isSelected ? .gray.opacity(0.7) : .clear,
                                radius: isSelected ? 4 : 0,
                                x: 0,
                                y: isSelected ? 2: 0)
                   
                )
                .onTapGesture {
                    homeViewModel.currentFilter = filter
                }
                
            } else {
                ErrorFiltersView()
            }
        }
        .padding(.vertical, 8)
        .onAppear {
            Task {
                imageLoader.download(from: filter.image)
                
            }
        }
    }
}

