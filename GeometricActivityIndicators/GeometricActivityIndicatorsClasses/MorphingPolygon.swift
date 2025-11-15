//
//  MorphingPolygon.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//


import SwiftUI

// A view that continuously morphs a polygon between 3 to 7 sides, here we can increase or decrease slides based on need
struct MorphingPolygon: View {
    
    // Keeps track of the current number of sides of the polygon
    @State private var sides = 3
    
    var body: some View {
        Polygon(sides: sides)   // Custom polygon shape
            .stroke(
                // Apply a rotating angular gradient outline
                AngularGradient(
                    gradient: Gradient(colors: [.pink, .purple, .cyan]),
                    center: .center
                ),
                lineWidth: 5
            )
            .frame(width: 90, height: 90) // Size of the polygon
            .animation(
                // Smooth in-out animation that repeats forever
                .easeInOut(duration: 0.7)
                    .repeatForever(autoreverses: true),
                value: sides // Re-animate whenever "sides" changes
            )
            .onAppear {
                // Repeatedly change number of sides every 0.5 seconds
                Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { _ in
                    // Cycle sides between 3 → 6 and repeat
                    sides = (sides == 7) ? 3 : sides + 1
                }
            }
    }
}
