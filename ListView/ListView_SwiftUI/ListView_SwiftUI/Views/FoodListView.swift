//
//  FoodListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct FoodListView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    
    var body: some View {
        NavigationView {
            List(foods) { food in
                HStack {
                    Text(food.image)
                    Text(food.name)
                }
            }
            .toolbar {
                Button {
                    let nFood = Food(name: "JV", image: "🍔", isFavorite: true)
                    withAnimation {
                        foods.append(nFood)
                    }
                } label: {
                    Label("Plus", systemImage: "plus")
                }
            }
            .navigationTitle("VT")
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
