//
//  HomeViewModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import Foundation

// MARK: - VIEW MODEL
class MealListViewModel: ObservableObject {
    // Create published variable to update UI on changes
    @Published var meals: [MealList] = []
    // Initiate data manager
    private let dataManager = MealListDataManager()
    
    // Fetch data, assign case on result
    func fetchMeals() {
        dataManager.fetchRemoteData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedMeals):
                    self?.meals = fetchedMeals
                case .failure(let error):
                    print("Error fetching meals: \(error)")
                }
            }
        }
    }
}
