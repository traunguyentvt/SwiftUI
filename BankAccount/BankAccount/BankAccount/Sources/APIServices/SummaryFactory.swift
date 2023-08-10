//
//  SummaryFactory.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation

class SummaryFactory: APIFactory {
    static let instance = SummaryFactory()
    
    func getSummaries(completed: @escaping (AccountResponse?, String?) -> Void) {
        API.getSummaries.get(request: RequestBase(), domain: "") { (response: AccountResponse?) in
            if let err = self.checkResponse(response: response) {
                completed(nil, err)
                return
            }
            
            completed(response, nil)
        }
    }
}
