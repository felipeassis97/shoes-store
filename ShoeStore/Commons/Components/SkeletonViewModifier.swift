//
//  SkeletonView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct SkeletonViewModifier: ViewModifier {
    let duration: Double
    @State private var blinking: Bool = false

    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.3 : 1)
            .animation(.easeInOut(duration: duration).repeatForever(), value: blinking)
            .onAppear {
                // Animation will only start when blinking value changes
                blinking.toggle()
            }
    }
}

extension View {
    func blinking(duration: Double = 0.5) -> some View {
        modifier(SkeletonViewModifier(duration: duration))
    }
}
