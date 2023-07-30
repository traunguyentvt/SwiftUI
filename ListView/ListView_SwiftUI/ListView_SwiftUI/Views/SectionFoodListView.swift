//
//  SectionFoodListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/29/23.
//

import SwiftUI

struct SectionFoodListView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    @State private var unhealthyFoods: [Food] = [Food(name: "Pizza", image: "🍕", isFavorite: false),
                                                 Food(name: "Burger", image: "🍔", isFavorite: false)]
    
    var body: some View {
        List {
            Section {
                ForEach(foods) { food in
                    FoodRow(food: food)
                }
            } header: {
                Text("Healthy Foods")
            } footer: {
                Text("YE-VT")
            }
            .headerProminence(.increased)
            
            Section {
                DisclosureGroup("Unhealthy Foods") {
                    ForEach(unhealthyFoods) { food in
                        FoodRow(food: food)
                    }
                }
            } footer: {
                Text("NT-VT")
            }
            
            Button {
                let nFood = Food(name: "VT", image: "🍔", isFavorite: true)
                withAnimation {
                    foods.append(nFood)
                }
            } label: {
                Label("Add", systemImage: "plus")
            }
        }
    }
}

struct SectionFoodListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionFoodListView()
    }
}
