//
//  Country.swift
//  News
//
//  Created by VT on 8/13/23.
//

import Foundation

enum Country {
    case tr
    case us
    case de
    case fr
    case gb
    case gr
    case ru
    
    var code: String {
        switch self {
        case .tr:
            return "tr"
        case .us:
            return "us"
        case .de:
            return "de"
        case .fr:
            return "fr"
        case .gb:
            return "gb"
        case .gr:
            return "gr"
        case .ru:
            return "ru"
        }
    }
}
