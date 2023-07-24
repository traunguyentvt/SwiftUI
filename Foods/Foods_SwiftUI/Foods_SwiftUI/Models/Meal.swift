//
//  Meal.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import SwiftUI

struct Meal: Codable, Hashable, Identifiable {
    var imageURL: String
    var id: String
    var category: MealCategory
    var name: String
    var location: String
    var rating: Double
    var tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case imageURL, id, name, location, rating, tags
        case category = "food"
    }
    
    static func preview() -> Meal {
        Meal(imageURL: "asian", id: "1", category: MealCategory.asian, name: "Asian Food", location: "Asian", rating: 5, tags: ["Fast Food"])
    }
}

extension Meal {
    func containsTag(_ tag: String) -> Bool {
        tags.first { $0 == tag } != nil
    }
}
