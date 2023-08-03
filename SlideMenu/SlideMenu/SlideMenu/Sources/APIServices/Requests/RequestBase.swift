//
//  RequestBase.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import ObjectMapper

class RequestBase: Mappable {
    
    var client_id: String?
    
    init() {
        client_id = Constants.API.apiKey
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        client_id <- map["client_id"]
    }
    
}
