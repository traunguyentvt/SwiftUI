//
//  HideTabbar.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct HideTabbar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero)
            .onAppear {
                Tool.hideTabbar()
            }
    }
}
