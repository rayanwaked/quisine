# Quisine

Quisine is a SwiftUI-based iOS application that allows users to explore and view dessert recipes.

## Project Structure

```
Quisine/
├── QuisineApp.swift
├── Modules/
│   ├── ContentView/
│   │   └── ContentView.swift
│   ├── Home/
│   │   ├── HomeModel.swift
│   │   ├── HomeViewModel.swift
│   │   └── HomeView.swift
│   └── Meal/
│       ├── MealModel.swift
│       ├── MealViewModel.swift
│       └── MealView.swift
├── Components/
│   ├── FilterComp.swift
│   └── FeatureComp.swift
└── Assets/
    ├── Sizes.swift
    └── Assets.xcassets
```

## Main Components

### QuisineApp.swift
The main entry point of the application, setting up the app structure and initial view.

### ContentView.swift
The root view of the application, currently displaying the HomeView.

### Home Module
- **HomeModel.swift**: Defines the `MealList` struct and `MealListDataManager` for fetching dessert meals from the API.
- **HomeViewModel.swift**: Manages the state and business logic for the home view.
- **HomeView.swift**: The main view displaying a list of dessert meals, including featured items and a scrollable list.

### Meal Module
- **MealModel.swift**: Defines the `Meal` struct and `MealDataManager` for fetching detailed meal information.
- **MealViewModel.swift**: Manages the state and business logic for the individual meal view.
- **MealView.swift**: Displays detailed information about a selected meal, including image, ingredients, and instructions.

### Components
- **FilterComp.swift**: A reusable component for filtering meals. It displays a toggleable button with a label and plus/minus icon.
  - Uses `FilterViewModel` to manage its active state.
  - Animates between active and inactive states.
  - Customizable label text.

- **FeatureComp.swift**: A reusable component for displaying featured meals.
  - Displays an asynchronously loaded image of the meal.
  - Shows the meal name in an overlaid text box with a custom corner shape.
  - Utilizes `GeometryReader` for responsive sizing.
  - Implements a custom `CustomCornerShape` for the text background.

## Features

- Fetches a list of dessert meals from an external API
- Displays a featured section with the first 5 meals using the `FeatureComp`
- Shows a scrollable list of remaining meals
- Provides filtering options using the `FilterComp`
- Allows users to view detailed information about each meal, including:
  - Meal image
  - Category and cuisine type
  - List of ingredients with measurements
  - Cooking instructions
  - YouTube link (if available)

## API Integration

The app uses TheMealDB API to fetch meal data:
- List of desserts: `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`
- Individual meal details: `https://themealdb.com/api/json/v1/1/lookup.php?i=[MEAL_ID]`

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run the app on a simulator or physical device

## Requirements

- iOS 15.0+
- Xcode 12.0+
- Swift 5.3+

## Future Improvements

- Implement meal filtering functionality using the `FilterComp`
- Add search capability
- Implement user favorites or bookmarking feature
- Enhance UI with custom themes and animations
- Extend the `FeatureComp` to support additional interactions or information display
