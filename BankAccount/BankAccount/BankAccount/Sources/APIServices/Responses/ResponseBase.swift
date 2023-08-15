//
//  ResponseBase.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation
import ObjectMapper

class ResponseBase: Mappable {
    
    var result: Int?
    var msg: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
    }
   
}
