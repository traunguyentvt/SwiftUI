//
//  ScrollIndicatorView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/21/23.
//

import Foundation
import SwiftUI


struct ScrollIndicatorView: View {
    let inspirations = Inspiration.createInspirations()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(inspirations) { inspiration in
                    InspirationRowView(inspiration: inspiration)
                }
            }
            .padding()
        }
    }
}


struct ScrollIndicatorView_Preview: PreviewProvider {
    static var previews: some View {
        ScrollIndicatorView()
    }
}
