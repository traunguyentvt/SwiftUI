//
//  CurrencyResponse.swift
//  PayPayCoding
//
//  Created by Shujat Ali on 29/07/2023.
//

import Foundation


struct CurrencyResponse: Decodable {
    let disclaimer: String?
    let license: String?
    let base: String?
    let rates: [String: Double]?
}

struct CurrencyRateItem: Hashable, Decodable {
    let ccy: String
    let rate: Double
    
    init(_ item: CurrencyRateItem, _ newRate: Double) {
        self.ccy = item.ccy
        self.rate = item.rate * newRate
    }
    
    init(_ item: Dictionary<String, Double>.Element) {
        self.ccy = item.key
        self.rate = item.value
    }
    
    var display: String {
        return "\(ccy)\n\(String(format: "%.2f", rate))"
    }
}


struct CurrencyData: Hashable, Decodable {
    let ccy: String
    let name: String
    
    init() {
        self.ccy = "USD"
        self.name = "United States"
    }
    
    init(item: Dictionary<String, String>.Element) {
        self.ccy = item.key
        self.name = item.value
    }
    
    var display: String {
        return name + " (\(ccy))"
    }
}
