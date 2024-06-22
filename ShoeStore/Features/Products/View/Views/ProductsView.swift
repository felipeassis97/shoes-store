//
//  ProductsView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import SwiftUI

struct ProductsView: View {
    var productsViewModel = ProductViewModel.instance
    
    var body: some View {
        List(productsViewModel.products) { product in
            Button(action: {
            }, label: {
                //StoreItemView(store: store)
                
                Text(product.title)
            })
        }
        .scrollDisabled(true)
        .scaledToFit()
        .listStyle(.plain)
        .foregroundStyle(.black)
        .listRowSeparator(.hidden)
        .scrollContentBackground(.hidden)
        .onAppear {
            if productsViewModel.products.count <= 0 {
                Task {
                    try await productsViewModel.getProducts()
                }
            }

        }
    }
}

#Preview {
    ProductsView()
}
