//
//  FoodCustomCellView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct FoodCustomCellView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    @State private var unhealthyFoods: [Food] = [Food(name: "Pizza", image: "🍕", isFavorite: false),
                                                 Food(name: "Burger", image: "🍔",isFavorite: false)]
    
    var body: some View {
        List {
            ForEach(foods) { food in
                FoodRow(food: food)
            }
            ForEach(unhealthyFoods) { food in
                FoodRow(food: food)
            }
            Button {
                let nfood = Food(name: "JV", image: "🍔", isFavorite: true)
                withAnimation {
                    foods.append(nfood)
                }
            } label: {
                Label("VT", systemImage: "plus")
            }
        }
    }
}

struct FoodCustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCustomCellView()
    }
}
