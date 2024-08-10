//
//  HomeModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: IMPORT
import Foundation

// MARK: - MEALLIST STUCT
/// Struct containing a list of all dessert meals' ID, name, and photo URL in the database
struct MealList: Codable {
    /// Unique ID
    let idMeal: String
    /// Meal Name
    let strMeal: String
    /// Meal Picture
    let strMealThumb: String
}

// MARK: - API RESPONSE
struct MealListResponse: Codable {
    let meals: [MealList]?
}

// MARK: - MEAL DATA MANAGER
class MealListDataManager {
    var mealList: [MealList] = []
    
    // MARK: FETCH REMOTE DATA
    /// Func to fetch data from an API endpoint
    func fetchRemoteData(completion: @escaping (Result<[MealList], Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Get the data from the API and return a result
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Return an error in failed instances
            if let error = error {
                print("An error occurred when fetching data:", error)
                completion(.failure(error))
                return
            }
            
            // Ensure data is not nil before proceeding
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            // Pass data into MealList if successfully fetched
            do {
                let decodedData = try JSONDecoder().decode(MealListResponse.self, from: data)
                
                // Filter out individual meals with null or empty values
                let filteredMeals = decodedData.meals?.filter { meal in
                    !meal.idMeal.isEmpty && !meal.strMeal.isEmpty && !meal.strMealThumb.isEmpty
                } ?? []
                
                self?.mealList = filteredMeals
                completion(.success(filteredMeals))
                
            // Print error if decoding failed
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(.failure(jsonError))
            }
        }
        
        task.resume()
    }
}
