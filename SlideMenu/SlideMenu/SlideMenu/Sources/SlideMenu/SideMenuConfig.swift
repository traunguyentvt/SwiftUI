//
//  SideMenuConfig.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import SwiftUI

struct SideMenuConfig {
    var menuBGColor: Color
    var menuBGOpacity: Double
    var menuWidth: CGFloat
    var animationDuration: Double
    
    init(menuBGColor: Color = .black, menuBGOpacity: Double = 0.3,
         menuWidth: CGFloat = 300, animationDuration: Double = 0.3) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
    }
}
