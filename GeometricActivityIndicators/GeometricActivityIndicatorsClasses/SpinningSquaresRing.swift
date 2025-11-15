//
//  SpinningSquaresRing.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//


import SwiftUI

// A spinning ring made of 8 small squares arranged in a circular pattern
struct SpinningSquaresRing: View {
    
    // Controls the spinning animation
    @State private var rotate = false
    
    var body: some View {
        ZStack {
            // Create 8 squares placed around a circle
            ForEach(0..<8) { i in
                
                Rectangle()
                    .fill(Color.mint)             // Square color
                    .frame(width: 24, height: 24) // Size of each square
                    
                    // Rotate each square by multiples of 45° (360° / 8 squares)
                    .rotationEffect(.degrees(Double(i) * 45))
                    
                    // Push each square outward from the center to form a ring
                    .offset(y: -35)
            }
        }
        // Rotate the entire ring continuously
        .rotationEffect(.degrees(rotate ? 360 : 0))
        
        // Smooth infinite spinning animation
        .animation(
            .linear(duration: 1.2)
                .repeatForever(autoreverses: false),
            value: rotate
        )
        
        // Start spinning when view appears
        .onAppear { rotate = true }
    }
}
