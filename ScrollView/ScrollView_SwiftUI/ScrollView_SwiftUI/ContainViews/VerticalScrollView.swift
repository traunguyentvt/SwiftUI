//
//  VerticalScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct VerticalScrollView: View {
    let inspirations = Inspiration.createInspirations()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(inspirations) { inspiration in
                        //card view
                        InspirationCardView(inspiration: inspiration)
                        //row view
//                        InspirationRowView(inspiration: inspiration)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
            .navigationTitle(Text("Inspiration - Vertical ScrollView"))
        }
    }
}

struct VerticalScrollView_Preview: PreviewProvider {
    static var previews: some View {
        VerticalScrollView()
    }
}
