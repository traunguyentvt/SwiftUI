//
//  AdaptiveCatView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/26/23.
//

import SwiftUI

struct AdaptiveCatView: View {
    
    @Environment(\.verticalSizeClass) var veri: UserInterfaceSizeClass?
    @Namespace var namespace
    
    var body: some View {
        GeometryReader { geometry in
            ConditionalStack(vAlignment: .center, hAlignment: .center, vSpacing: 10, hSpacing: 10, isVStack: geometry.size.width < geometry.size.height) {
                VStack(alignment: .leading) {
                    HStack {
                        Image("cat1")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100, alignment: .center)
                        
                        Text("Johnny V")
                    }
                    
                    Text("Group in SwiftUI is a type that collects multiple instances of a content type — like views, scenes, or commands — into a single unit. Group doesn't have any visual representation, its just a container much like VStack and HStack .")
                        .font(.footnote)
                }
                .matchedGeometryEffect(id: "text", in: namespace)
                
                Image("cat2")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "large image", in: namespace)
            }
            .padding()
        }
        .animation(.easeInOut(duration: 0.5))
    }
}

struct AdaptiveCatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdaptiveCatView().environment(\.verticalSizeClass, .regular)
        }
    }
}
