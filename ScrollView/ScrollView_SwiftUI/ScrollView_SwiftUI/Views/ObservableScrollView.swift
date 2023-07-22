//
//  ObservableScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation
import SwiftUI


//A scrollview wrapper that tracks scrolloffset changes
struct ObservableScrollView<Content>: View where Content: View {
    
    //@Namespace creates an animation namespace to allow matched geometry effects, which can be shared by other views. This owns its data. @NSApplicationDelegateAdaptor is used to create and register a class as the app delegate.
    @Namespace var scrollSpace
    
    //SwiftUI uses @Binding to tell the system that a property has read/write access to a value without ownership. Creating a binding occurs by passing in a State property with the $ prefix. We use $ to pass a binding preference, because without $ Swift will pass a copy of the value instead of passing bindable reference.
    @Binding var scrollOffset: CGFloat
    
    let content: () -> Content
    
    init(scrollOffset: Binding<CGFloat>, @ViewBuilder content: @escaping() -> Content) {
        _scrollOffset = scrollOffset
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            content()
                .background(GeometryReader { geo in
                    let offset = -geo.frame(in: .named(scrollSpace)).minY
                    Color.clear
                        .preference(key: ScrollViewOffsetPreferenceKey.self,
                                    value: offset)
                })
        }
        .coordinateSpace(name: scrollSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            scrollOffset = value
        }
    }
    
}


//Simple preference that observes a CGFloat
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
