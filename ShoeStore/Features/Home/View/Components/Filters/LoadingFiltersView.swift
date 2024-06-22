//
//  LoadingFiltersView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct LoadingFiltersView: View {
    var body: some View {
        ScrollView (.horizontal){
            HStack {
                ForEach(1...4, id: \.self) {_ in
                    Rectangle()
                        .scaledToFill()
                        .frame(width: 100, height: 50)
                        .foregroundStyle(.neutral300)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .blinking(duration: 0.75)
                 }
            }
        }        
        .scrollIndicators(.hidden)
    }
}

#Preview {
    LoadingFiltersView()
}
