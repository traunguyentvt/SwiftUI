//
//  FoodRow.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/28/23.
//

import SwiftUI

struct FoodRow: View {
    
    let food: Food
    
    var body: some View {
        HStack {
            Text(food.image)
            Text(food.name)
            Spacer()
            Image(systemName: food.isFavorite ? "heart.fill" : "heart")
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Food.createExamples()[0])
            .padding()
    }
}
