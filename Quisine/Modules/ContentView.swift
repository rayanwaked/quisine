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
    @StateObject private var onboardViewModel = OnboardViewModel()

    var body: some View {
        ZStack {
            if onboardViewModel.hasCompletedOnboarding {
                HomeView()
                    .opacity(homeViewOpacity)
            } else {
                OnboardView(viewModel: onboardViewModel)
                    .opacity(homeViewOpacity)
            }
            
            // Show LaunchView on app open
            if isShowingLaunchView {
                LaunchView()
            }
        }
        // Handle the opacity change and LaunchView state
        .onAppear {
            DispatchQueue.main.async {
                self.homeViewOpacity = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.homeViewOpacity = 1
                    self.isShowingLaunchView = false
                }
            }
        }
        .onChange(of: onboardViewModel.hasCompletedOnboarding) { newValue in
            if newValue {
                withAnimation(.easeIn(duration: 0.5)) {
                    homeViewOpacity = 1
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
