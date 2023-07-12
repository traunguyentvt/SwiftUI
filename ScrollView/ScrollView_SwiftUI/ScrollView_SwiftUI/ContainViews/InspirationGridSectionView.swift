//
//  InspirationGridSectionView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationGridSectionView: View {
    private let inspirations = Inspiration.createInspirations()
    private let rows = Array(repeating: GridItem(.fixed(120)), count: 2)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(inspirations) { inspiration in
                    InspirationTillView(inspiration: inspiration, size: 120, cornerRadius: 5)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 15)
        }
    }
}


struct InspirationGridSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationGridSectionView()
    }
}
