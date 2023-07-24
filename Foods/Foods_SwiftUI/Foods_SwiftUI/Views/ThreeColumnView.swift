//
//  ThreeColumnView.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation
import SwiftUI


struct ThreeColumnView: View {
    
    //@StateObject property wrapper is a specialized form of @ObservableObject, having all the same functionality with one important addition: it should be used to create observed objects, rather than just one that was passed in externally.
    @StateObject var viewModel = MealCategoryViewModel()
    
    //SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are values types. When we put @State before a property, we effectively move its storage out from our struct & into shared storage manage by SwiftUI.
//    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    

    var body: some View {
        NavigationView {
            ContentView(meals: viewModel.filteredMeals, selectedMeal: $viewModel.selectedMeal)
            .searchable(text: $viewModel.searchText)
            .navigationTitle(viewModel.selectedCategory?.rawValue ?? "Your Meals")
        }
        
    }
}


struct ThreeColumnView_Preview: PreviewProvider {
    static var previews: some View {
        ThreeColumnView()
    }
}
