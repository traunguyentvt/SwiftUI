//
//  Food.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/27/23.
//

import Foundation

struct Food: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool
    
    static func createExamples() -> [Food] {
        [Food(name: "Apple", image: "🍎", isFavorite: true),
         Food(name: "Banana", image: "🍌", isFavorite: false),
         Food(name: "Cherry", image: "🍒", isFavorite: true),
         Food(name: "Mango", image: "🥭", isFavorite: true),
         Food(name: "Kiwi", image: "🥝", isFavorite: false),
         Food(name: "Strawberry", image: "🍓", isFavorite: false),
         Food(name: "Graps", image: "🍇", isFavorite: true)
        ]
    }
}
