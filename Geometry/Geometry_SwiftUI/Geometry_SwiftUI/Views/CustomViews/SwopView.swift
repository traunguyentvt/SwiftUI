//
//  SwopView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/27/23.
//

import SwiftUI

struct SwopView: View {
    
    @Namespace var namespace
    @State var isVertical: Bool = false
    
    var body: some View {
        VStack {
            if isVertical {
                VStack {
                    content
                }
            } else {
                HStack {
                    content
                }
            }
            
            Button {
                withAnimation {
                    isVertical.toggle()
                }
            } label: {
                Text("Swop views")
            }
            .padding()
        }
    }
    
    @ViewBuilder var content: some View {
        Group {
            Rectangle()
                .matchedGeometryEffect(id: "rectangle", in: namespace)
            
            Circle()
                .matchedGeometryEffect(id: "circle", in: namespace)
        }
    }
}

struct SwopView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwopView(isVertical: true)
            SwopView()
        }
    }
}
