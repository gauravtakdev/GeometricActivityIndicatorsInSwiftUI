//
//  TwistingDiamond.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//


import SwiftUI

// A rotating diamond outline that spins continuously
struct TwistingDiamond: View {
    
    // Controls the rotation animation
    @State private var angle = false
    
    var body: some View {
        DiamondShape()                         // Custom diamond-shaped outline
            .stroke(Color.orange, lineWidth: 4) // Apply stroke color and width
            .frame(width: 72, height: 72)       // Size of the diamond
            
            // Rotate between 0° → 360° based on "angle" state
            .rotationEffect(.degrees(angle ? 360 : 0))
            
            // Animation settings
            .animation(
                .easeInOut(duration: 1.5)       // Smooth rotation
                    .repeatForever(autoreverses: false), // Infinite spin
                value: angle
            )
            
            // Start rotation when the view appears
            .onAppear { angle = true }
    }
}

// MARK: - Diamond Shape
// A custom geometric shape that draws a diamond (a rotated square)
struct DiamondShape: Shape {
    
    /// Draws a diamond centered inside the provided rectangle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Convenience values for center and half sizes
        let midX = rect.midX
        let midY = rect.midY
        let width = rect.width / 2
        let height = rect.height / 2
        
        // Move to the top point of the diamond
        path.move(to: CGPoint(x: midX, y: midY - height))
        
        // Draw right point
        path.addLine(to: CGPoint(x: midX + width, y: midY))
        
        // Draw bottom point
        path.addLine(to: CGPoint(x: midX, y: midY + height))
        
        // Draw left point
        path.addLine(to: CGPoint(x: midX - width, y: midY))
        
        // Close shape to connect back to the top
        path.closeSubpath()
        
        return path
    }
}
