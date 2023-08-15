//
//  Tool.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation
import UIKit

struct Tool {
    static func findTabbar() -> UITabBar? {
        let allSubViews = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews() ?? []
        for v in allSubViews {
            if let item = v as? UITabBar {
                return item
            }
        }
        
        return nil
    }
    
    static func showTabbar() {
        if let tabbar = findTabbar() {
            tabbar.isHidden = false
        }
    }
    
    static func hideTabbar() {
        if let tabbar = findTabbar() {
            tabbar.isHidden = true
        }
    }
}
