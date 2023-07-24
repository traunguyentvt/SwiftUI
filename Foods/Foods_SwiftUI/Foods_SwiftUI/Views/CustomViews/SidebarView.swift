//
//  SidebarView.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation
import SwiftUI

struct SidebarView: View {
    
    //SwiftUI uses @Binding to tell the system that a property has read/write access to the value without ownership. Creating a binding occurs by passing in a state property with the $ prefix. We use $ to pass a binding preference, because without $ Swift will pass a copy of the value instead of passing bindable reference.
    @Binding var selectedCategory: MealCategory?
    
    let categories = MealCategory.allCases
    
    var body: some View {
        List(selection: $selectedCategory) {
            ForEach(categories, id: \.self) { store in
                Text(store.rawValue)
                    .tag(store)
            }
        }
//        .navigationTitle("Categories")
    }
    
}


struct SidebarView_Preview: PreviewProvider {
    static var previews: some View {
        SidebarView(selectedCategory: .constant(.asian))
    }
}
