//
//  UpdatedSearchSuggestionMealView.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI


struct UpdatedSearchSuggestionMealView: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredMeals) { meal in
                    MealCardView(meal: meal)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find your next meal")
            
            .searchable(text: $viewModel.searchText, suggestions: {
                ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
            })
        }
    }
    
}


struct UpdatedSearchSuggestionMealView_Preview: PreviewProvider {
    static var previews: some View {
        UpdatedSearchSuggestionMealView()
    }
}
