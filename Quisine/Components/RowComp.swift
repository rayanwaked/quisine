//
//  RowComp.swift
//  Quisine
//
//  Created by Rayan Waked on 8/11/24.
//

// MARK: - IMPORT
import SwiftUI

//MARK: - VIEW
func RowComp(for meal: MealList) -> some View {
    NavigationLink(destination: MealView(mealID: meal.idMeal)) {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)
            
            Text(meal.strMeal.capitalized)
                .foregroundStyle(Color.primary)
                .padding(.leading)
            
            Spacer()
        }
    }
}
