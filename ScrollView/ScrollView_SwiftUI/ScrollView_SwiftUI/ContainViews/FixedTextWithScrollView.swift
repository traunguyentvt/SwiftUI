//
//  FixedTextWithScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI


struct FixedTextWithScrollView: View {
    let msg = "The beauty of SwiftUI is its simplicity, and TabView is no exception. Offering dynamic, customizable content views, TabView is the cornerstone of navigation in many SwiftUI applications.\n\nIn previous blog posts, I've dissected the art of SwiftUI presentations and navigation, from presenting views in SwiftUI using sheets, modals, popovers, and alerts to navigating better in SwiftUI with NavigationView. If you're looking for a comprehensive overview of those topics, I encourage you to read The A-Z of SwiftUI Presentations and Navigation and Better Navigation in SwiftUI with Navigation Stack.\n\nAs I guide you through this subject, you'll comprehend TabView's functionality. You'll learn how to implement and customize it. While delving into the core components, you'll see the versatility of TabView. You'll also understand its unique interplay with SwiftUI’s declarative syntax."
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Image("minime")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Mini-me")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    
                    Text(msg)
                        .multilineTextAlignment(.leading)
                }
                .padding()
            }
            .navigationTitle(Text("FixedText - ScrollView"))
        }
    }
}


struct FixedTextWithScrollView_Preview: PreviewProvider {
    static var previews: some View {
        FixedTextWithScrollView()
    }
}
