//
//  ContentView.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("6 Stunning Geometric Activity Indicators").bold().foregroundColor(.white).font(.largeTitle).padding(.vertical, 20).multilineTextAlignment(.center)
                    .frame(alignment: .center)
                
                VStack(spacing: 50) {
                    HStack(spacing: 100) {
                        ExpandingHexagon()
                        MorphingPolygon()
                        RotatingSquares()
                    }
                    HStack(spacing: 100) {
                        RotatingTriangle()
                        SpinningSquaresRing()
                        TwistingDiamond()
                    }
                    Spacer().frame(height: 20)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

#Preview {
    ContentView()
}
