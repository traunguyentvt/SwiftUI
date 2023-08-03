//
//  APIFactory.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation

class APIFactory {
    func checkResponse<T: ResponseBase>(response: T?) -> String? {
        guard let response = response else {
            return "Response is null"
        }
        
        let result = response.result ?? 0
        if result == APIResult.success.rawValue {
            return nil
        }
        return response.msg
    }
}
