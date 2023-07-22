//
//  InspirationScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationScrollView: View {
    private let inspirations = Inspiration.createInspirations()
    
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
                    
                    Section {
                        InspirationGridSectionView()
                    } header: {
                        Text("Second Section")
                            .modifier(SectionHeaderStyling())
                    }
                    
                    Section {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(inspirations) { inspiration in
                                InspirationRowView(inspiration: inspiration)
                            }
                            .padding(.horizontal)
                        }
                    }  header: {
                        Text("Third Section")
                            .modifier(SectionHeaderStyling())
                    }
                }
            }
            .padding(.bottom, 10)
            .navigationTitle("Multi-Sections ScrollView")
        }
    }
}


struct InspirationScrollView_Preview: PreviewProvider {
    static var previews: some View {
        InspirationScrollView()
    }
}
