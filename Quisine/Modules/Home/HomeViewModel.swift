//
//  HomeViewModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import Foundation

// MARK: - FILTER OPTION
struct FilterOption: Identifiable {
    let id = UUID()
    let name: String
    var isActive: Bool = false
}

// MARK: - VIEW MODEL
class HomeViewModel: ObservableObject {
    @Published var meals: [MealList] = []
    @Published var filters: [FilterOption] = [
        FilterOption(name: "Cake"),
        FilterOption(name: "Cheesecake"),
        FilterOption(name: "Cookie"),
        FilterOption(name: "Chocolate"),
        FilterOption(name: "Pie"),
        FilterOption(name: "Tart"),
        FilterOption(name: "Pudding"),
        FilterOption(name: "Pancake"),
        FilterOption(name: "Brownie"),
        FilterOption(name: "Mousse")
    ]
    private let dataManager = MealListDataManager()
    
    // MARK: - FILTER FUNCTION
    var filteredMeals: [MealList] {
        let activeFilters = filters.filter { $0.isActive }.map { $0.name }
        
        if activeFilters.isEmpty {
            return meals
        } else {
            return meals.filter { meal in
                let mealName = meal.strMeal
                return activeFilters.contains { filter in
                    mealName.contains(filter)
                }
            }
        }
    }
    
    // MARK: - FETCH FUNCTION
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
    
    // MARK: - TOGGLE FUNCTION
    func toggleFilter(_ filter: FilterOption) {
        if let index = filters.firstIndex(where: { $0.id == filter.id }) {
            filters[index].isActive.toggle()
            objectWillChange.send()
        }
    }
}
