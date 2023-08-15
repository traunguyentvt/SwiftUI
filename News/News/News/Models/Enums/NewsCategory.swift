//
//  NewsCategory.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

enum NewsCategory: CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    
    var title: String {
        switch self {
        case .general:
            return "General"
        case .entertainment:
            return "Entertainment"
        case .business:
            return "Business"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
        }
    }
    
    var imageName:String {
        switch self {
        case .business:
            return "bs"
        case .entertainment:
            return "ent"
        case .general:
            return "gen"
        case .health:
            return "he"
        case .science:
            return "sci"
        case .sports:
            return "spr"
        case .technology:
            return "tec"
        }
    }
}

extension NewsCategory: Identifiable {
    var id: UUID {
        return UUID()
    }
}
