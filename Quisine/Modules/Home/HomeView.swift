//
//  HomeView.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// TODO: Fix list loading color and background color

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct HomeView: View {
    @StateObject private var viewModel = MealListViewModel()
    
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
        Image("GrainyGradient")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.8)
    }
    
    // MARK: - HEADER
    var logo: some View {
        HStack {
            Text("Quisine")
                .font(.system(size: 28, design: .serif))
                .font(.title)
            Spacer()
        }
        .standardPadding()
    }
    
    var header: some View {
        HStack {
            Text("What do you want to make today?")
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
                FilterComp(label: "Japanese")
                FilterComp(label: "Swiss")
                FilterComp(label: "Turkish")
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
                .padding(.horizontal)
                .padding(.vertical, 4)
            
            Text("Explore")
                .font(.title2.bold())
                .foregroundStyle(Color.primary)
            
            ForEach(viewModel.meals.dropFirst(5), id: \.idMeal) { meal in
                mealRow(for: meal)
            }
        }
        .standardPadding()
        .background(Color.background)
    }
}

// MARK: - MEAL ROW
private func mealRow(for meal: MealList) -> some View {
    NavigationLink(destination: MealView(mealID: meal.idMeal)) {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)
            
            Text(meal.strMeal)
                .foregroundStyle(Color.primary)
                .padding(.leading)
            
            Spacer()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    HomeView()
}
