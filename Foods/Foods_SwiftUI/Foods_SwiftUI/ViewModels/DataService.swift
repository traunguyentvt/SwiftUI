//
//  DataService.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation

struct DataService {
    static func loadMeals() -> [Meal] {
        var meals = [Meal]()
        
        if let filePath = Bundle.main.url(forResource: "DBdata", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: filePath) {
                if let decodedData = try? JSONDecoder().decode([Meal].self, from: jsonData) {
                    meals = decodedData
                }
            }
        }
        
        return meals
    }
}
