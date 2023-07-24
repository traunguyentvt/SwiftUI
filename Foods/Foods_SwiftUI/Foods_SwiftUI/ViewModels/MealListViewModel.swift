//
//  MealListViewModel.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/23/23.
//

import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var meals: [Meal]
    @Published var searchText: String = ""
    
    @Published var suggestions = ["Muffin", "Noodles", "Beef", "Wraps", "Hamburger", "Chicken",
                                  "Falafel", "Pita", "Avocado", "Tomato",
                                  "Chocolate", "Strawberry", "Coffee"]
    
    init() {
        meals = DataService.loadMeals()
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else {
            return []
        }
        
        return suggestions.sorted().filter {
            $0.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredMeals: [Meal] {
        guard !searchText.isEmpty else {
            return meals
        }
        
        return meals.filter { meal in
            meal.name.lowercased().contains(searchText.lowercased())
        }
    }
    
}
