//
//  SingleSelectionListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/28/23.
//

import SwiftUI

struct SingleSelectionListView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    @State private var selectedFoodId: UUID?
    
    var body: some View {
        List(foods, selection: $selectedFoodId) { food in
            FoodRow(food: food)
                .listRowBackground(selectedFoodId==food.id ? .green:Color(.tertiarySystemBackground))
        }
    }
}

struct SingleSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelectionListView()
    }
}
