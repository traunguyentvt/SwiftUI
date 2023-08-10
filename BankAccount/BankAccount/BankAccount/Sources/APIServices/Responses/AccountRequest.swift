//
//  AccountRequest.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation
import ObjectMapper

class AccountResponse: ResponseBase {
    
    var accounts: [Account]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        accounts <- map["accounts"]
    }
}
