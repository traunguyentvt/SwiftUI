//
//  ScrollOffsetExampleView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/21/23.
//

import Foundation
import SwiftUI

struct ScrollOffsetExampleView: View {
    
    let inspirations = Inspiration.createInspirations()
    
    //SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are values types. When we put @State before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI.
    @State var scrollOffset = CGFloat.zero
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
//                VStack {
//                    Text( scrollOffset > 100 ? "small detail" : "Large detail")
//                        .font(scrollOffset > 100 ? .headline : .title2)
//
//                    if scrollOffset < 50  {
//                        Text("more")
//                    }
//                }
//                .animation(.default, value: scrollOffset)
//                .frame(height: max(50, 100 - max(scrollOffset, 0)))
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .foregroundColor(.white)
                
                ObservableScrollView(scrollOffset: $scrollOffset) {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(inspirations) { inspiration in
                            InspirationRowView(inspiration: inspiration)
                        }
                    }
                    .padding()
                }
            }
             .navigationBarTitle("ScrollOffset: \(scrollOffset)",
                                 displayMode: .inline)
        }
    }
    
}


struct ScrollOffsetExampleView_Preview: PreviewProvider {
    static var previews: some View {
        ScrollOffsetExampleView()
    }
}
