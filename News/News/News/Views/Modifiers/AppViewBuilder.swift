//
//  AppViewBuilder.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct AppViewBuilder: ViewModifier {
    let textColor: Color
    let textFont: Font
    let textAlignment: TextAlignment
    
    init(textColor: Color = .black, textFont: Font = .system(size: 15), textAlignment: TextAlignment = .leading) {
        self.textColor = textColor
        self.textFont = textFont
        self.textAlignment = textAlignment
    }
    
    func body(content: Content) -> some View {
        content
            .font(textFont)
            .foregroundColor(textColor)
            .multilineTextAlignment(textAlignment)
            .fixedSize(horizontal: false, vertical: true)
    }
}
