//
//  ResponseBase.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation
import ObjectMapper

class ResponseBase: Mappable, Decodable {
    
    var result: Int?
    var msg: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        result <- (map["result"])
        msg <- map["msg"]
    }
   
}
