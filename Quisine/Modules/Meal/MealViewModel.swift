//
//  MealViewModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import Foundation

// MARK: VIEW MODEL
class MealViewModel: ObservableObject {
    @Published var meal: Meal?
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
                case .failure(let error):
                    print("Error fetching meal: \(error)")
                    // Handle error (e.g., show an alert to the user)
                }
            }
        }
    }
}
