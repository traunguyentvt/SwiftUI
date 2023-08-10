//
//  Account.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation
import ObjectMapper

class Account: Identifiable, Mappable {
    
    let id = UUID()
    var accountNumber: String?
    var accountBsb: String?
    var accountLabel: String?
    var currentBalance: String?
    var availableBalance: String?
    var transactions: String?
    var index = 0
    
    init() {
        
    }
    
//    init(accountNumber: String, accountBsb: String, accountLabel: String, currentBalance: String, availableBalance: String, transactions: String) {
//        self.accountNumber = accountNumber
//        self.accountBsb = accountBsb
//        self.accountLabel = accountLabel
//        self.currentBalance = currentBalance
//        self.availableBalance = availableBalance
//        self.transactions = transactions
//    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        accountNumber <- map["accountNumber"]
        accountBsb <- map["accountBsb"]
        accountLabel <- map["accountLabel"]
        currentBalance <- map["currentBalance"]
        availableBalance <- map["availableBalance"]
        transactions <- map["transactions"]
    }
    
//    static func AccountData() -> [Account] {
//        [
//            Account(accountNumber: "001", accountBsb: "VT_001", accountLabel: "VT 123 12 31 23 12 3131", currentBalance: "1992", availableBalance: "1990", transactions: "http://www.mocky.io/v2/5abb0f8d3500001b4a73a7e4"),
//            Account(accountNumber: "002", accountBsb: "VT_002", accountLabel: "JV  123 123123", currentBalance: "1111", availableBalance: "1110", transactions: "http://www.mocky.io/v2/5abb0fda350000540073a7e5"),
//            Account(accountNumber: "003", accountBsb: "VT_003", accountLabel: "TVT asdfsaf", currentBalance: "1111992", availableBalance: "1111990", transactions: "http://www.mocky.io/v2/5abb0f8d3500001b4a73a7e4"),
//            Account(accountNumber: "004", accountBsb: "VT_004", accountLabel: "T werwer", currentBalance: "1992", availableBalance: "1992", transactions: "http://www.mocky.io/v2/5abb0ff03500004a0073a7e6")
//        ]
//    }
}
