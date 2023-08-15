//
//  CurrencyFactory.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation
import zlib

class CurrencyFactory: APIFactory {
    static let instance = CurrencyFactory()
    
    func getLastest(completed: @escaping (CurrencyResponse?, String?) -> Void) {
        API.getLastest.get(request: RequestBase(), domain: "") { (response: CurrencyResponse?) in
            if let error = self.checkResponse(response: response) {
                completed(nil, error)
                return
            }
            
            completed(response, nil)
        }
    }
}
