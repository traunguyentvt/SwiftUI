//
//  MealCategoryViewModel.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation

//ObservableObject is one of the most useful property wrappers in SwiftUI that requires your object to conform the ObservableObject protocol. This protocol stands for an object with a publisher that emits before the object has changed and allows you to tell SwiftUI to trigger a view redraw.
class MealCategoryViewModel: ObservableObject {
    
    //@Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur. SwiftUI will automatically monitor for such changes, and re-invoke the body property of any views that rely on the data.
    @Published private var meals: [Meal]
    @Published var selectedCategory: MealCategory?
    @Published var selectedMeal: Meal?
    @Published var searchText: String = ""
    
    init() {
        meals = DataService.loadMeals()
    }
    
    var filteredMeals: [Meal] {
        let filteredMeals = mealsForSelectedCategory
        if searchText.isEmpty {
            return filteredMeals
        }
        return filteredMeals.filter { meal in
            meal.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var mealsForSelectedCategory: [Meal] {
        if let selectedCategory = selectedCategory {
            return meals.filter { $0.category == selectedCategory }
        }
        return meals
    }
    
}
