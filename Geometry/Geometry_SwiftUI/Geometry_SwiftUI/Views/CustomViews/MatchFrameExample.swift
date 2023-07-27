//
//  MatchFrameExample.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/27/23.
//

import SwiftUI

struct MatchFrameExample: View {
    
    @Namespace private var namespace
    @State private var isMatched: Bool = false
    private let geometryId: String = "geometryId"
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text("Johnny")
                    .fixedSize()
                    .padding()
                    .border(Color.yellow)
                    .matchedGeometryEffect(id: geometryId, in: namespace, properties: .size, anchor: .center, isSource: isMatched)
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                            isMatched = true
                        }
                    }
                
                Text("Selection")
                    .matchedGeometryEffect(id: geometryId, in: namespace, properties: .size, anchor: .center, isSource: !isMatched)
                    .onTapGesture {
                        withAnimation {
                            isMatched = false
                        }
                    }
            }
            .padding()
            .background(
                Rectangle()
                    .fill(Color.red)
                    .matchedGeometryEffect(id: geometryId, in: namespace, properties: .size, anchor: .center, isSource: false)
                    .zIndex(0)
                    .border(Color.pink, width: 2)
            )
            
            Text("Group in SwiftUI is a type that contains multiple instances of a content type like views, scenes, or commands into a single unit. Group doesn't have any visual representation, its just a container much like VStack and HStack.")
                .padding()
        }
    }
}

struct MatchFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        MatchFrameExample()
    }
}
