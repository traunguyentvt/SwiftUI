//
//  HorizontalScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct HorizontalScrollView: View {
    let inspirations = Inspiration.createInspirations()
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(inspirations) { inspiration in
                        InspirationCardView(inspiration: inspiration)
                    }
                }
                .frame(height: 200)
                .padding()
                
                Spacer()
            }
            .navigationTitle(Text("Horizontal ScrollView"))
        }
    }
}


struct HorizontalScrollView_Preview: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView()
    }
}
