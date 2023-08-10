//
//  AccountFactory.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation

class AccountFactory: APIFactory {
    static let instance = AccountFactory()
    
    func getAccountTransactions(url: String, completed: @escaping (TransactionResponse?, String?) -> Void) {
        API.emptyAPI.get(request: RequestBase(), domain: url) { (response: TransactionResponse?) in
            if let err = self.checkResponse(response: response) {
                completed(nil, err)
                return
            }
            
            completed(response, nil)
        }
    }
}

