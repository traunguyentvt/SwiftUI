//
//  SectionHeaderStyling.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct SectionHeaderStyling: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.headline)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
    }
}
