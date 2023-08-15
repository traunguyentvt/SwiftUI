//
//  View+Extensions.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI
import UIKit

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
    
    func hideTabbar() -> some View {
        return self.modifier(HideTabbar())
    }
    
    func showTabbar() -> some View {
        return self.modifier(ShowTabbar())
    }
}
