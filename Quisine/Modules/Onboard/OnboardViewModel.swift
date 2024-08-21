//
//  OnboardViewModel.swift
//  Quisine
//
//  Created by Rayan Waked on 8/12/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW MODEL
class OnboardViewModel: ObservableObject {
    @Published var currentPage: Int = 1
    @Published var hasCompletedOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(hasCompletedOnboarding, forKey: "hasCompletedOnboarding")
        }
    }
    
    init() {
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    }

    func completeOnboarding() {
        hasCompletedOnboarding = true
    }

    func resetOnboarding() {
        hasCompletedOnboarding = false
        currentPage = 1
    }
}
