//  StoresListView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import SwiftUI

struct StoresListView: View {
    var homeViewModel = HomeViewModel.instance
    
    var body: some View {
        List(homeViewModel.stores) { store in
            Button(action: {
            }, label: {
                StoreItemView(store: store)
            })
        }
        .scrollDisabled(true)
        .scaledToFit()
        .listStyle(.plain)
        .foregroundStyle(.black)
        .listRowSeparator(.hidden)
        .scrollContentBackground(.hidden)
        .onAppear {
            Task {
                try await homeViewModel.getStores()
            }
        }
    }
}

