//
//  LaunchVIew.swift
//  Quisine
//
//  Created by Rayan Waked on 8/10/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct LaunchView: View {
    @State private var animationProgress: CGFloat = 1
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(decorative: "GrainyGradient")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 3, height: geometry.size.height * 3)
                    .opacity(0.8)
                    .mask(
                        Circle()
                            .scale(0 + animationProgress)
                    )
                    .offset(x: geometry.size.width * -1 + animationProgress * 250, y: geometry.size.height * -1)
            }
            .onAppear {
                withAnimation(.snappy(duration: 4)) {
                    animationProgress = 0
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

// MARK: - PREVIEW
#Preview {
    LaunchView()
}
