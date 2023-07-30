//
//  ListStylingView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/27/23.
//

import SwiftUI

struct ListStylingView: View {
    
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
                Text("Healthy foods")
            } footer: {
                Text("Try to eat them regularly")
            }
            
            Section {
                ForEach(unhealthyFoods) { food in
                    FoodRow(food: food)
                }
            } header: {
                Text("Unhealthy foods")
            } footer: {
                Text("You should try to avoid them and only eat them occasionally")
            }
            
            Button {
                let nFood = Food(name: "Food " + "\(foods.count)", image: "\(foods.count)", isFavorite: false)
                withAnimation {
                    foods.append(nFood)
                }
            } label: {
                Label("Add", systemImage:"plus")
            }
            .padding()
        }
    }
}

struct ListStylingView_Previews: PreviewProvider {
    static var previews: some View {
        ListStylingView()
            .listStyle(.plain)
            .previewDisplayName("plain")
        
        ListStylingView()
            .listStyle(.inset)
            .previewDisplayName("inset")
    }
}
