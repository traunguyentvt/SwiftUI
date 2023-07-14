//
//  PinnedScrollableView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI

struct PinnedScrollableView: View {
    let firstInspirations = Inspiration.createInspirations()[0...2]
    let secondInspirations = Inspiration.createInspirations()[3...5]
    let thirdInspirations = Inspiration.createInspirations()[6...9]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(firstInspirations) { inspiration in
                            InspirationRowView(inspiration: inspiration)
                        }
                    } header: {
                        SectionHeaderView(title: "First Section")
                    }
                    
                    Section {
                        ForEach(secondInspirations) { inspiration in
                            InspirationRowView(inspiration: inspiration)
                        }
                    } header: {
                        SectionHeaderView(title: "Second Section")
                    }
                    
                    Section {
                        ForEach(thirdInspirations) { inspiration in
                            InspirationRowView(inspiration: inspiration)
                        }
                    } header: {
                        SectionHeaderView(title: "Third Section")
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text("PinnedScrollableView"))
        }
    }
}


struct PinnedScrollableView_Preview: PreviewProvider {
    static var previews: some View {
        PinnedScrollableView()
    }
}
