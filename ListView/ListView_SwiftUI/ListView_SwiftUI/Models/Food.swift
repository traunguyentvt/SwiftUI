//
//  Food.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/27/23.
//

import SwiftUI

struct Food: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool
    var color: Color = .pink
    
    static func createExamples() -> [Food] {
        [Food(name: "Apple", image: "🍎", isFavorite: true, color: .pink),
         Food(name: "Banana", image: "🍌", isFavorite: false, color: .blue),
         Food(name: "Cherry", image: "🍒", isFavorite: true, color: .yellow),
         Food(name: "Mango", image: "🥭", isFavorite: true, color: .orange),
         Food(name: "Kiwi", image: "🥝", isFavorite: false, color: .green),
         Food(name: "Strawberry", image: "🍓", isFavorite: false, color: .black),
         Food(name: "Graps", image: "🍇", isFavorite: true, color: .gray)
        ]
    }
    
    static func createFoods() -> [Food] {
        [Food(name: "VT", image: "🍎", isFavorite: true, color: .pink),
         Food(name: "JV", image: "🍌", isFavorite: false, color: .blue),
         Food(name: "TVT", image: "🍒", isFavorite: true, color: .green),
         Food(name: "J", image: "🥭", isFavorite: true, color: .yellow),
         Food(name: "V", image: "🥝", isFavorite: false, color: .blue),
         Food(name: "YEVT", image: "🍓", isFavorite: false, color: .blue),
         Food(name: "AYE-VT", image: "🍇", isFavorite: true, color: .gray)
        ]
    }
    
    
}
