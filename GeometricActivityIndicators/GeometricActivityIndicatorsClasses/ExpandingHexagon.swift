//
//  ExpandingHexagon.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 14/11/25.
//
import SwiftUI

struct ExpandingHexagon: View {
    @State private var scale: CGFloat = 0.5
    // this scaling decides scale factor of animation
    
    var body: some View {
        Polygon(sides: 6) // this slides decides, How many slides It would have, We can increase or decrease its value based on our need
            .stroke(LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5) // here we can also customise colors of animations"
            .frame(width: 70, height: 70) // we can update the frame width and height too
            .scaleEffect(scale)
            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: scale) // duration can be updated as per the need of animation duration
            .onAppear { scale = 1.2 }
    }
}
