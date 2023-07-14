//
//  PagingScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI
//import Introspect

struct PagingScrollView: View {
    let inspirations = Inspiration.createInspirations()
    let padding: CGFloat = 10
    let rows = [
        GridItem(.fixed(100), spacing: 5),
        GridItem(.fixed(100), spacing: 5),
        GridItem(.fixed(100), spacing: 5)
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 0) {
                        ForEach(inspirations) { inspiration in
                            InspirationRowView(inspiration: inspiration)
                                .frame(width: geometry.size.width - (2 * padding),
                                       alignment: .leading)
                                .padding(.horizontal, padding)
                        }
                    }
                }
            }
//            .introspectScrollView { view in
//                view.isPagingEnabled = true
//            }
            .navigationBarTitle(Text("Paging ScrollView"))
        }
    }
}


struct PagingScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PagingScrollView()
    }
}
