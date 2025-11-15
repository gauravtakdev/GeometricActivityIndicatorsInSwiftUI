//
//  APICallingViewWithLoadingOverlay.swift
//  GeometricActivityIndicators
//
//  Created by Gaurav Tak on 15/11/25.
//
import SwiftUI

struct APICallingViewWithLoadingOverlay: View {
    @State var isLoading = false
    @State var loaderType : LoaderType = .ExpandingHexagonLoader
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 24) {
                
                Button("Show ExpandingHexagonLoader") {
                    print("ExpandingHexagonLoader Button tapped")
                    loaderType = .ExpandingHexagonLoader
                    fetchPosts()
                }.buttonStyle(.borderedProminent)
                
                Button("Show MorphingPolygonLoader") {
                    print("MorphingPolygonLoader Button tapped")
                    loaderType = .MorphingPolygonLoader
                    fetchPosts()
                }.buttonStyle(.bordered)
                
                Button("Show RotatingSquaresLoader") {
                    print("RotatingSquaresLoader Button tapped")
                    loaderType = .RotatingSquaresLoader
                    fetchPosts()
                }.buttonStyle(.borderedProminent)
                
                Button("Show RotatingTriangleLoader") {
                    print("RotatingTriangleLoader Button tapped")
                    loaderType = .RotatingTriangleLoader
                    fetchPosts()
                }.buttonStyle(.bordered)
                
                Button("Show SpinningSquaresRingLoader") {
                    print("SpinningSquaresRingLoader Button tapped")
                    loaderType = .SpinningSquaresRingLoader
                    fetchPosts()
                }.buttonStyle(.borderedProminent)
                
                Button("Show TwistingDiamondLoader") {
                    print("TwistingDiamondLoader Button tapped")
                    loaderType = .TwistingDiamondLoader
                    fetchPosts()
                }.buttonStyle(.bordered)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            if isLoading {
                LoadingOverlayView(loaderType: $loaderType)
            }
        }.background(Color.black)
        
    }
    
    func fetchPosts() {
        isLoading = true
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // 1. Handle error
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }
            
            // 2. Validate response code
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code:", httpResponse.statusCode)
            }
            
            // 3. Parse data
            guard let data = data else {
                print("❌ No data found")
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self.isLoading = false
            })
            
        }
        
        task.resume()
    }
}



