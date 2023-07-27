//
//  ConditionalStack.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/26/23.
//

import SwiftUI

struct ConditionalStack<Content>: View where Content: View {
    
    var content: () -> Content
    
    let hSpacing: CGFloat
    let vSpacing: CGFloat
    let vAlignment: HorizontalAlignment
    let hAlignment: VerticalAlignment
    
    let isVStack: Bool
    
    init(vAlignment: HorizontalAlignment = .center,
         hAlignment: VerticalAlignment = .center,
         vSpacing: CGFloat = 0,
         hSpacing: CGFloat = 0,
         isVStack: Bool,
         @ViewBuilder content: @escaping() -> Content) {
        self.content = content
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
        self.vAlignment = vAlignment
        self.hAlignment = hAlignment
        self.isVStack = isVStack
    }
    
    var body: some View {
        Group {
            if isVStack {
                VStack(alignment: vAlignment, spacing: vSpacing) {
                    content()
                }
            } else {
                HStack(alignment: hAlignment, spacing: hSpacing) {
                    content()
                }
            }
        }
    }
}

struct ConditionalStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConditionalStack(isVStack: true) {
                Rectangle().frame(width: 100, height: 100, alignment: .center)
//                Spacer()
                Circle().frame(width: 100, height: 100, alignment: .center)
            }
        }
    }
}
