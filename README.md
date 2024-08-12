<img width="2041" alt="Screenshot 2024-08-12 at 11 44 41 AM" src="https://github.com/user-attachments/assets/187adf2b-eb61-4a3d-b8b8-d9b2f8925ac3">

# Quisine

Quisine is a SwiftUI-based iOS application that allows users to explore and view dessert recipes.
This project was done as a take-home assignment for Fetch. See guidelines here: `https://fetch-hiring.s3.amazonaws.com/iOS+coding+exercise.pdf`

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run the app on a simulator or physical device

## Project Structure

```
Quisine/
├── QuisineApp.swift
├── Modules/
│   ├── ContentView/
│   │   └── ContentView.swift
│   ├── Onboard/
│   │   ├── OnboardViewModel.swift
│   │   └── OnboardView.swift
│   ├── Home/
│   │   ├── HomeModel.swift
│   │   ├── HomeViewModel.swift
│   │   └── HomeView.swift
│   └── Meal/
│       ├── MealModel.swift
│       ├── MealViewModel.swift
│       └── MealView.swift
├── Components/
│   ├── CheckboxComp.swift
│   ├── FilterComp.swift
│   ├── FeatureComp.swift
│   └── RowComp.swift
├── Launch/
│   ├── LaunchScreen.storyboard
│   └── LaunchView.swift
└── Assets/
├── Sizes.swift
└── Assets.xcassets
```

## Overview of Major Files

### QuisineApp.swift
The main entry point of the application, setting up the app structure and initial view.

### ContentView.swift
The root view of the application, managing the display of LaunchView, OnboardView, and HomeView based on the app state.

### Onboard Module
- **OnboardViewModel.swift**: Manages the state for the onboarding process, tracking current page and completion status.
- **OnboardView.swift**: Guides new users through the app's features with multiple pages of information.

### Home Module
- **HomeModel.swift**: Defines the `MealList` struct and `MealListDataManager` for fetching dessert meals from the API.
- **HomeViewModel.swift**: Manages the state and business logic for the home view, including meal filtering.
- **HomeView.swift**: The main view displaying a list of dessert meals, including featured items and a scrollable list.

### Meal Module
- **MealModel.swift**: Defines the `Meal` struct and `MealDataManager` for fetching detailed meal information.
- **MealViewModel.swift**: Manages the state and business logic for the individual meal view.
- **MealView.swift**: Displays detailed information about a selected meal, including image, ingredients, and instructions.

### Components
- **CheckboxComp.swift**: A custom checkbox toggle style used in the meal detail view.
  - Implements a button with a checkmark or square icon.
  - Toggles between checked and unchecked states.

- **FilterComp.swift**: A reusable component for filtering meals.
  - Displays a toggleable button with a label and plus/minus icon.
  - Animates between active and inactive states.
  - Customizable label text and colors.

- **FeatureComp.swift**: A reusable component for displaying featured meals.
  - Displays an asynchronously loaded image of the meal.
  - Shows the meal name in an overlaid text box with a custom corner shape.
  - Utilizes `GeometryReader` for responsive sizing.
  - Implements a custom `CustomCornerShape` for the text background.

- **RowComp.swift**: A component for displaying individual meals in a list.
  - Shows a small image of the meal alongside its name.
  - Used within a NavigationLink for navigation to the MealView.

### Launch
- **Launch Screen.storyboard**: Implements a static image as fallback in instances where LaunchView.swift may not appear
- **LaunchView.swift**: Implements an animated launch screen with a scaling circle effect using a masked image.

### Utility
- **Sizes.swift**: Provides utility extensions for standard padding and screen dimensions.

## Features

1. **Launch Animation**: Animated launch screen with a scaling circle effect.
2. **Onboarding**: Introduces users to the app's features.
3. **Home Screen**: 
   - Displays featured desserts in a horizontal scrollable view.
   - Shows a filterable list of all desserts.
   - Implements custom filter components.
4. **Meal Detail View**:
   - Shows detailed information about a selected dessert.
   - Includes image, ingredients (with checkboxes), instructions, and a YouTube link if available.
5. **Data Fetching**: Retrieves dessert data from TheMealDB API.
6. **Custom UI Components**: Includes custom-designed components for a unique user interface.

## API Integration

The app uses TheMealDB API to fetch meal data:
- List of desserts: `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`
- Individual meal details: `https://themealdb.com/api/json/v1/1/lookup.php?i=[MEAL_ID]`

## Requirements

- iOS 15.0+
- Xcode 12.0+
- Swift 5.3+

## Rights

