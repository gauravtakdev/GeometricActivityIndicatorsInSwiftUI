//
//  Polygon.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//
import SwiftUI

// MARK: - Polygon Shape
struct Polygon: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        guard sides >= 3 else { return Path() }
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let angle = (2 * .pi) / CGFloat(sides)
        let radius = min(rect.width, rect.height) / 2
        var path = Path()
        
        for i in 0..<sides {
            let x = center.x + radius * cos(CGFloat(i) * angle - .pi/2)
            let y = center.y + radius * sin(CGFloat(i) * angle - .pi/2)
            if i == 0 { path.move(to: CGPoint(x: x, y: y)) }
            else { path.addLine(to: CGPoint(x: x, y: y)) }
        }
        path.closeSubpath()
        return path
    }
}
