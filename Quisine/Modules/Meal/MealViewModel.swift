//
//  MealViewModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import SwiftUI
import Foundation

// MARK: - VIEW MODEL
class MealViewModel: ObservableObject {
    @Published var meal: Meal?
    @Published var ingredientCheckedStates: [Bool] = []
    private let dataManager = MealDataManager()
    private let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    func fetchMeal() {
        dataManager.fetchRemoteData(mealID: mealID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let meals):
                    self?.meal = meals.first
                    if let ingredientCount = self?.meal?.ingredients.count {
                        self?.ingredientCheckedStates = Array(repeating: false, count: ingredientCount)
                    }
                case .failure(let error):
                    print("Error fetching meal: \(error)")
                    // Handle error (e.g., show an alert to the user)
                }
            }
        }
    }
}
