//
//  RotatingTriangle.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//
import SwiftUI

// A simple rotating triangle loader using the Polygon shape (3 sides)
struct RotatingTriangle: View {
    
    // State variable used to trigger rotation animation
    @State private var rotate = false
    
    var body: some View {
        Polygon(sides: 3)                        // Use the custom Polygon shape (triangle)
            .stroke(Color.orange, lineWidth: 4)  // Draw only the outline with a purple color
            .frame(width: 90, height: 90)        // Set the size of the triangle
            
            // Rotate from 0° to 360° based on "rotate" state
            .rotationEffect(.degrees(rotate ? 360 : 0))
            
            // Linear animation for smooth continuous spinning
            .animation(
                .linear(duration: 1)             // 1-second full rotation
                    .repeatForever(autoreverses: false), // Spin non-stop in one direction
                value: rotate
            )
            
            // Start rotating when the view appears
            .onAppear { rotate = true }
    }
}
