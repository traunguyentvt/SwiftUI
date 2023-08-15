//
//  APIFactory.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation

class APIFactory {
    func checkResponse<T: ResponseBase>(response: T?) -> String? {
        guard let response = response else {
            return "Response is null"
        }
        
        return response.msg
    }
}
