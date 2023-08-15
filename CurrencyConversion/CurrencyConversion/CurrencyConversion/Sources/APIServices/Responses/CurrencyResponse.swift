//
//  CurrencyResponse.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation
import ObjectMapper

class CurrencyResponse: ResponseBase {
    var timestamp: Int?
    var base: String?
    var rates: [String: Float]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        timestamp <- map["timestamp"]
        base <- map["base"]
        rates <- map["rates"]
    }
}
