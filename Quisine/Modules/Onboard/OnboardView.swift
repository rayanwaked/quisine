//
//  OnboardView.swift
//  Quisine
//
//  Created by Rayan Waked on 8/12/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct OnboardView: View {
    @StateObject var viewModel = OnboardViewModel()
    
    var body: some View {
        ZStack {
            background
            switch viewModel.currentPage {
            case 1: welcome
            case 2: homeOnboard
            case 3: mealOnboard
            default: welcome
            }
        }
    }
}

// MARK: - EXTENSION
private extension OnboardView {
    var background: some View {
        VStack {
            Image("GrainyGradient")
                .resizable()
                .scaledToFill()
                .overlay(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.01), Color.background]),
                    startPoint: .top, endPoint: .bottom))
                .frame(minWidth: 0)
                .frame(maxHeight: 250)
                .edgesIgnoringSafeArea(.all)
            Spacer()
        }
        .background(Color.background)
    }
    
    var welcome: some View {
        VStack(spacing: 14) {
            Spacer()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 86))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.indigo.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                .padding(.bottom, 40)
            
            HStack(spacing: 6) {
                Text("Welcome to")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                Text("Quisine.")
                    .font(.system(size: 30, design: .serif))
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
            }
            
            Text("Your new")
            + Text(" favorite app ")
                .italic()
                .font(.system(size: 18, design: .serif))
                .foregroundColor(Color.accentColor)
            + Text("for baking desserts")
            
            Spacer()
            
            HStack {
                Text("Skip")
                    .padding()
                    .foregroundStyle(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        viewModel.completeOnboarding()
                    }
                Spacer()
                Text("Next")
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        viewModel.currentPage += 1
                    }
            }
        }
        .padding()
    }
    
    var homeOnboard: some View {
        VStack(spacing: 14) {
            Spacer()
            
            Image(systemName: "menucard.fill")
                .font(.system(size: 86))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.indigo.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                .padding(.bottom, 40)
            
            Text("Explore featured desserts and browse the catalog")
                .font(.title.bold())
                .multilineTextAlignment(.center)
            
            VStack {
                Text("It's easy to find something you love- ")
                    .italic()
                    .font(.system(size: 18, design: .serif))
                    .foregroundColor(Color.accentColor)
                + Text("Just swipe through the featured, browse the list, or use filters")
            }
            .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Text("Skip")
                    .padding()
                    .foregroundStyle(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        viewModel.completeOnboarding()
                    }
                Spacer()
                Text("Next")
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        viewModel.currentPage += 1
                    }
            }
        }
        .padding()
    }
    
    var mealOnboard: some View {
        VStack(spacing: 14) {
            Spacer()
            
            Image(systemName: "ruler.fill")
                .font(.system(size: 86))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.indigo.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                .padding(.bottom, 40)
            
            Text("Read up on measurements, instructions, and more")
                .font(.title.bold())
                .multilineTextAlignment(.center)
            
            VStack {
                Text("You'll find handy checkboxes next to ingredients and intructions")
                + Text(" without the author's life story")
                    .italic()
                    .font(.system(size: 18, design: .serif))
                    .foregroundColor(Color.accentColor)
            }
            .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Next")
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        viewModel.completeOnboarding()
                    }
            }
        }
        .padding()
    }
}

// MARK: - PREVIEW
#Preview {
    OnboardView()
}
