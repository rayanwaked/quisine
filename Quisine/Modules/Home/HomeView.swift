//
//  HomeView.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                VStack {
                    logo
                    ScrollView {
                        header
                        filter
                        VStack(spacing: 0) {
                            featured
                            list
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .onAppear(perform: viewModel.fetchMeals)
        }
    }
}

// MARK: - EXTENSION
private extension HomeView {
    // MARK: - BACKGROUND
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
        // This modifier applies to the entire view's background due to the ZStack layering
        .background(Color.background)
    }
    
    // MARK: - HEADER
    var logo: some View {
        HStack {
            Text("Quisine.")
                .font(.system(size: 28, design: .serif))
                .font(.title)
            Spacer()
        }
        .standardPadding()
    }
    
    var header: some View {
        HStack {
            Text("What do you want to bake today?")
                .font(.system(size: 32, weight: .bold))
            Spacer()
        }
        .standardPadding()
        .padding(.top, 40)
    }
    
    // MARK: - FILTER
    var filter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.filters) { filter in
                    FilterComp(label: filter.name, isActive: filter.isActive) {
                        viewModel.toggleFilter(filter)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
    }
    
    // MARK: - TOP FIVE MEALS
    var featured: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured")
                .font(.title2.bold())
                .padding(.bottom, -30)
                .standardPadding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(viewModel.meals.prefix(5), id: \.idMeal) { meal in
                        NavigationLink(destination: MealView(mealID: meal.idMeal)) {
                            FeatureComp(
                                name: meal.strMeal,
                                url: meal.strMealThumb
                            )
                        }
                        .frame(width: 350, height: 200)
                        .padding(.trailing, -10)
                        .tint(Color.black)
                    }
                }
            }
            .frame(height: 250)
        }
        .padding(.top, 20)
        .background(Color.background)
    }
    
    // MARK: - REMAINING MEALS
    var list: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            Divider()
                .padding(.vertical, 4)
            
            Text("Explore")
                .font(.title2.bold())
                .foregroundStyle(Color.primary)
            
            ForEach(viewModel.filteredMeals, id: \.idMeal) { meal in
                     RowComp(for: meal)
                 }
        }
        .standardPadding()
        .background(Color.background)
    }
}

// MARK: - PREVIEW
#Preview {
    HomeView()
}
