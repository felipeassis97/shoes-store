//
//  Filters.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct FiltersListView: View {
     var homeViewModel = HomeViewModel.instance

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(homeViewModel.filters) { data in
                    FilterItemView(filter: data)
                }
            }
        }
        .padding(.vertical, 4)
        .scrollIndicators(.hidden)
        .onAppear {
            Task {
                try await homeViewModel.getFilters()
            }
        }
    }
}

#Preview {
    FiltersListView()
}
