//
//  InspirationListView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationListView: View {
    private let inspirations = Inspiration.createInspirations()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(inspirations) { inspiration in
                    //row view
//                    InspirationRowView(inspiration: inspiration)
                    //card view
                    InspirationCardView(inspiration: inspiration)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            .listStyle(.plain)
            .navigationTitle("ListView")
        }
    }
}


struct InspirationListView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationListView()
    }
}
