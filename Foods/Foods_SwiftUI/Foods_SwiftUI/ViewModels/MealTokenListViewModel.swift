//
//  MealTokenListViewModel.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/23/23.
//

import Foundation

enum MealSearchToken: String, CaseIterable, Hashable, Identifiable {
    case fourStarReview = "4+ star review"
    case onSale = "On sale"
    case toGo = "To go"
    case coupon = "coupon"
    
    var id: String { rawValue }
    
    func icon() -> String {
        switch self {
            case .fourStarReview:
               return "star"
            case .onSale:
               return "paperplane"
            case .toGo:
               return "figure.walk"
            case .coupon:
               return "tag"
        }
    }
}

enum MealSearchScope: Hashable {
    case all
    case category(MealCategory)
}

class MealTokenListViewModel: ObservableObject {
    @Published var meals: [Meal]
    @Published var searchText: String = ""
    @Published var selectedTokens = [MealSearchToken]()
    @Published var mealSearchScope: MealSearchScope = .all
    
    init() {
        meals = DataService.loadMeals()
    }
    
    var filteredMeals: [Meal] {
        var results = meals
        
        switch mealSearchScope {
        case .all:
            break
        case .category(let category):
            results = results.filter { $0.category == category }
        }
        
        if searchText.count > 0 {
            results = results.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        for token in selectedTokens {
            switch token {
                case .fourStarReview:
                    results = results.filter { $0.rating >= 4 }
            
                case .onSale, .coupon, .toGo:
                results = results.filter { $0.containsTag(token.rawValue) }
            }
        }
        
        return results;
    }
}
