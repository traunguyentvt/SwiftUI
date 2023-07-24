//
//  Foods_SwiftUIApp.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import SwiftUI

@main
struct Foods_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
//            ThreeColumnView()
            
            TabView {
                SearchSuggestionMealListView()
                    .tabItem {
                        Text("SearchSuggestion")
                    }
                
                UpdatedSearchSuggestionMealView()
                    .tabItem {
                        Text("UpdatedSearchSuggestion")
                    }
                
                SearchTokenMealListView()
                    .tabItem {
                        Text("SearchToken")
                    }
            }
            
        }
    }
}
