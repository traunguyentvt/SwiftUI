//
//  MealCategory.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import Foundation

enum MealCategory: String, Codable, CaseIterable {
    var id: String { rawValue }
    
    case asian = "Asian"
    case african = "African"
    case american = "American"
    case europian = "Europian"
    case oceanian = "Oceanian"
}

extension MealCategory {
    enum ErrorType: Error {
        case encoding
        case decoding
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let decodedValue = try value.decode(String.self)
        
        switch decodedValue {
        case "Asian":
            self = .asian
        case "African":
            self = .african
        case "American":
            self = .american
        case "Europian":
            self = .europian
        case "Oceanian":
            self = .oceanian
        default:
            print("Error occurs while decoding 'Food' key")
            throw ErrorType.decoding
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .asian:
            try container.encode("Asian")
        case .african:
            try container.encode("African")
        case .american:
            try container.encode("American")
        case .europian:
            try container.encode("Europian")
        case .oceanian:
            try container.encode("Oceanian")
        }
    }
}
