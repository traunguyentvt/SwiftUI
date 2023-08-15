//
//  MenuItemType.swift
//  News
//
//  Created by VT on 8/13/23.
//

import Foundation

enum MenuItemType {
    case home
    case discover
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .discover:
            return "Discover"
        case .search:
            return "Search"
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .discover:
            return "safari"
        case .search:
            return "magnifyingglass"
        }
    }
}
