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
            VStack {
                Text("6 Geometric Custom Activity Indicators").bold().foregroundColor(.white).font(.largeTitle).padding(.vertical, 20).multilineTextAlignment(.center)
                    .frame(alignment: .center)
                
                 ExpandingHexagon()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.9))
    }
}

#Preview {
    ContentView()
}
