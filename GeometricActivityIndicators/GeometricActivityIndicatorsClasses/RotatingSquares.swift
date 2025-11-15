//
//  RotatingSquares.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//


import SwiftUI

// An activity indicator made of 4 squares rotating with a staggered delay
struct RotatingSquares: View {
    
    // Controls the rotation state for animation
    @State private var rotate = false
    
    var body: some View {
        HStack(spacing: 6) {   // Arrange 4 squares horizontally with spacing
            ForEach(0..<4) { i in   // Loop to create 4 squares
                
                Rectangle()
                    .fill(Color.mint)              // Square color
                    .frame(width: 30, height: 30)    // Square size
                    
                    // Apply rotation animation (0° → 360°)
                    .rotationEffect(.degrees(rotate ? 360 : 0))
                    
                    // Animation with delay to give staggered rotating effect
                    .animation(
                        .easeInOut(duration: 0.8)    // Smooth rotation
                            .repeatForever()         // Infinite loop
                            .delay(Double(i) * 0.15),// Each square starts later
                        value: rotate
                    )
                    .padding(.horizontal, 5)         // Extra spacing
            }
        }
        .onAppear { 
            // Trigger the animation when the view appears
            rotate = true
        }
    }
}
