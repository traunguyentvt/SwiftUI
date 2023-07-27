//
//  ContentView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AdaptiveCatView()
                .tag(0)
                .tabItem {
                    Image(systemName: "arrowshape.zigzag.forward")
                    Text("Swop position")
                }
            
            CatCollectionView()
                .tag(1)
                .tabItem {
                    Image(systemName: "star")
                    Text("VT")
                }
            
            PickerExamples()
                .tag(2)
                .tabItem {
                    Image(systemName: "lasso")
                    Text("Johnny")
                }
            
            EmojisPicker()
                .tag(3)
                .tabItem {
                    Image(systemName: "eyedropper")
                    Text("YEVT")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
