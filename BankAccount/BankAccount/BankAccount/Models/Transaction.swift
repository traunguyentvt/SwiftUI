//
//  Transaction.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation
import ObjectMapper

class Transaction: Identifiable, Mappable {
    
    let id = UUID()
    var dateString: String?
    var description: String?
    var amount: Double?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dateString <- map["date"]
        description <- map["description"]
        amount <- map["amount"]
        
        if let str = dateString {
            let splits = str.components(separatedBy: "T")
            if splits.count > 1 {
                dateString = splits[0]
            }
        }
    }
}
