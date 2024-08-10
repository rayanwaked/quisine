// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct MealView: View {
    @StateObject private var viewModel: MealViewModel
    
    init(mealID: String) {
        _viewModel = StateObject(wrappedValue: MealViewModel(mealID: mealID))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let meal = viewModel.meal {
                    image(for: meal)
                    title(for: meal)
                    categorycuisine(for: meal)
                    ingredients(for: meal)
                    instructions(for: meal)
                    youtubeLink(for: meal)
                } else {
                    ProgressView()
                }
            }
            .padding()
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.fetchMeal()
        }
    }
}

// MARK: - EXTENSIONS
private extension MealView {
    // MARK: - IMAGE
    @ViewBuilder
    func image(for meal: Meal) -> some View {
        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .cornerRadius(8)
    }
    
    // MARK: - TITLE
    @ViewBuilder
    func title(for meal: Meal) -> some View {
        Text(meal.strMeal)
            .font(.title.bold())
    }
    
    // MARK: - CATEGORY & CUISINE
    @ViewBuilder
    func categorycuisine(for meal: Meal) -> some View {
        HStack {
            if let category = meal.strCategory {
                Text("\(category) Based Meal")
                    .font(.subheadline)
                    .foregroundStyle(.primary.opacity(0.6))
            }
            
            Text("·")
                .font(.subheadline)
                .foregroundStyle(.primary.opacity(0.6))
            
            if let area = meal.strArea {
                Text("\(area) Cuisine")
                    .font(.subheadline)
                    .foregroundStyle(.primary.opacity(0.6))
            }
        }
    }
    
    // MARK: - INGREDIENTS
    @ViewBuilder
    func ingredients(for meal: Meal) -> some View {
        Divider()
        
        Text("Ingredients")
            .font(.title2.bold())
            .padding(.bottom, 2)
        
        ForEach(meal.ingredients.sorted(by: { $0.key < $1.key }), id: \.key) { ingredient, measure in
            HStack {
                Text("•")
                if !measure.isEmpty {
                    Text("\(measure) \(ingredient)")
                } else {
                    Text(ingredient)
                }
            }
        }
    }
    
    // MARK: - INSTRUCTIONS
    @ViewBuilder
    func instructions(for meal: Meal) -> some View {
        Divider()
        
        Text("Instructions")
            .font(.title2.bold())
            .padding(.bottom, 2)
        
        if let instructions = meal.strInstructions {
            VStack(alignment: .leading) {
                Text(instructions)
                    .font(.system(size: 18, design: .serif))
            }
        }
    }
    
    // MARK: - YOUTUBE LINK
    @ViewBuilder
    func youtubeLink(for meal: Meal) -> some View {
        Divider()
        
        if let youtubeLink = meal.strYoutube {
            Link("Watch on YouTube", destination: URL(string: youtubeLink)!)
                .foregroundColor(.blue)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    MealView(mealID: "52772")
}
