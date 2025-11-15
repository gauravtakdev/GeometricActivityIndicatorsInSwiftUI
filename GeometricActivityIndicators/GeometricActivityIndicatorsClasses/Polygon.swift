//
//  Polygon.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//
import SwiftUI

// A custom Shape that draws a polygon with a given number of sides
struct Polygon: Shape {
    var sides: Int   // Number of polygon sides (e.g. 3 = triangle, 4 = square)
    
    func path(in rect: CGRect) -> Path {
        
        // A polygon must have at least 3 sides.
        guard sides >= 3 else { return Path() }
        
        // Calculate the center point of the drawing area
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        // Angle between each vertex in radians (360° / number of sides)
        let angle = (2 * .pi) / CGFloat(sides)
        
        // Radius of the polygon (half of the smaller side of the frame)
        let radius = min(rect.width, rect.height) / 2
        
        var path = Path()
        
        // Loop to calculate each vertex of the polygon
        for i in 0..<sides {
            
            // Calculate x and y position of the vertex
            // Subtracting .pi/2 rotates the polygon so the first point is at the top
            let x = center.x + radius * cos(CGFloat(i) * angle - .pi/2)
            let y = center.y + radius * sin(CGFloat(i) * angle - .pi/2)
            
            // For the first point, move to position.
            // For all others, draw a line to create edges.
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        // Close the path to connect the last point to the first
        path.closeSubpath()
        
        return path
    }
}
