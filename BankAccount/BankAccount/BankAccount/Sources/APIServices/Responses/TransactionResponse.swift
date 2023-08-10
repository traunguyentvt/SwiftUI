//
//  TransactionResponse.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation
import ObjectMapper

class TransactionResponse: ResponseBase {
    
    var transactions: [Transaction]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        transactions <- map["transactions"]
    }
}
