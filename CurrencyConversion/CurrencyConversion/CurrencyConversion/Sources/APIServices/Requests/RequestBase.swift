//
//  RequestBase.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation
import ObjectMapper

class RequestBase: Mappable, Decodable {
    
    var app_id = "92f011f0e44949fc8e1113240fdda86e"
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        app_id <- map["app_id"]
    }
}
