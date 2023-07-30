//
//  MultipleSelectionListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/29/23.
//

import SwiftUI

struct MultipleSelectionListView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    @State private var selectedFoodIds: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List(foods, selection: $selectedFoodIds) { food in
                FoodRow(food: food)
            }
            .navigationTitle("VT")
            .toolbar {
                EditButton()
            }
            .safeAreaInset(edge: .bottom, spacing: 10) {
                if selectedFoodIds.count > 0 {
                    Button {
                        for id in selectedFoodIds {
                            if let firstIndex = foods.firstIndex(where: { id == $0.id }) {
                                foods[firstIndex].isFavorite = true
                            }
                        }
                    } label: {
                        Text("YE")
                    }
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(.background)
                }
            }
        }
    }
}

struct MultipleSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionListView()
    }
}
