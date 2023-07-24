//
//  SearchTokenMealListView.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI


struct SearchTokenMealListView: View {
    
    @StateObject var viewModel = MealTokenListViewModel()
    
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
            
            .searchable(text: $viewModel.searchText)
        }
    }
    
}


struct SearchTokenMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTokenMealListView()
    }
}
