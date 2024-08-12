//
//  MealModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import Foundation

// MARK: - MEAL STRUCT
struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String?
    let strCategory: String?
    let strArea: String?
    let strTags: String?
    let strYoutube: String?
    var ingredients: [String: String] = [:]
    
    // MARK: - CODING KEYS
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strInstructions, strCategory, strArea, strTags, strYoutube
    }
    
    // MARK: - INITIALIZE
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        // Decode required fields
        idMeal = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "idMeal")!)
        strMeal = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeal")!)
        strMealThumb = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMealThumb")!)
        
        // Decode optional fields
        strInstructions = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strInstructions")!)
        strCategory = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strCategory")!)
        strArea = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strArea")!)
        strTags = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strTags")!)
        strYoutube = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strYoutube")!)
        
        // Dynamically decode ingredients and measurements
        for i in 1...50 {
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(i)")!
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey)?
                .trimmingCharacters(in: .whitespacesAndNewlines),
               !ingredient.isEmpty {
                let measure = (try container.decodeIfPresent(String.self, forKey: measureKey)?
                    .trimmingCharacters(in: .whitespacesAndNewlines)) ?? ""
                ingredients[ingredient] = measure
            }
        }
    }
}

// MARK: - DYNAMIC CODING KEYS
struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }
}

// MARK: - API RESPONSE
struct MealResponse: Codable {
    let meals: [Meal]?
}

// MARK: - MEAL DATA MANAGER
class MealDataManager {
    var meal: [Meal] = []
    
    // MARK: - FETCH REMOTE DATA
    /// Func to fetch data from an API endpoint
    func fetchRemoteData(mealID: String, completion: @escaping (Result<[Meal], Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")!
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
            
            // Pass data into Meal if successfully fetched
            do {
                let decodedData = try JSONDecoder().decode(MealResponse.self, from: data)
                if let meals = decodedData.meals {
                    self?.meal = meals
                    completion(.success(meals))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No meal found"])
                    completion(.failure(error))
                }
                // Print error if decoding failed
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(.failure(jsonError))
            }
        }
        
        task.resume()
    }
}
