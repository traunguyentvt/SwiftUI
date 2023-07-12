//
//  InspirationScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationScrollView: View {
    private var inspirations = Inspiration.createInspirations()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(inspirations) { inspiration in
                                InspirationCardView(inspiration: inspiration)
                            }
                        }
                        .padding()
                    }
                    .frame(height: 150)
                    
                    
                }
            }
            .navigationTitle("Inspirations - ScrollView")
        }
    }
}


struct InspirationScrollView_Preview: PreviewProvider {
    static var previews: some View {
        InspirationScrollView()
    }
}
