//
//  ContentView.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation
import SwiftUI


struct ContentView: View {
    
    let meals: [Meal]
    
    //
    @Binding var selectedMeal: Meal?
    
    var body: some View {
        List(selection: $selectedMeal) {
            ForEach(meals) { meal in
                MealCardView(meal: meal)
                    .tag(meal)
                    .listRowInsets(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
            }
            .listRowSeparator(.hidden, edges: .all)
        }
        .listStyle(.plain)
    }
    
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(meals: [Meal.preview()], selectedMeal: .constant(nil))
            .listStyle(.plain)
    }
}
