//
//  LoadingOverlayView.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//

import SwiftUI

struct LoadingOverlayView: View {
    var message: String? = nil
    @Binding var loaderType: LoaderType
    
    var body: some View {
        ZStack {
            // Dim background
            Color.white.opacity(0.3)
                .ignoresSafeArea()
            
            // Activity indicator + message
            VStack(spacing: 12) {
                switch loaderType {
                case .ExpandingHexagonLoader:
                    ExpandingHexagon()
                case .MorphingPolygonLoader:
                    MorphingPolygon()
                case .RotatingSquaresLoader:
                    RotatingSquares()
                case .RotatingTriangleLoader:
                    RotatingTriangle()
                case .SpinningSquaresRingLoader:
                    SpinningSquaresRing()
                case .TwistingDiamondLoader:
                    TwistingDiamond()
                }
            }
           // .padding(24)
           // .background(Color.black.opacity(0.6))
            //.cornerRadius(16)
        }
        //.transition(.opacity.animation(.easeInOut(duration: 0.3)))
    }
}
