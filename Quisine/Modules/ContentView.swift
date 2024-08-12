//
//  ContentView.swift
//  Quisine
//
//  Created by Rayan Waked on 8/8/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct ContentView: View {
    @State private var isShowingLaunchView = true
    @State private var homeViewOpacity: Double = 0
    
    var body: some View {
        ZStack {
            HomeView()
                .opacity(homeViewOpacity)
            
            if isShowingLaunchView {
                LaunchView()
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                self.homeViewOpacity = 0
            }
            
            // Schedule the transition
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeIn(duration: 1)) {
                    self.homeViewOpacity = 1
                    self.isShowingLaunchView = false
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
