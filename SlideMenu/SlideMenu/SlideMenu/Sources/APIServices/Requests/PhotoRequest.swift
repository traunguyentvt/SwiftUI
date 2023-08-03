//
//  PhotoRequest.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import ObjectMapper

class PhotoRequest: RequestBase {
    
    var page: Int = 0
    var per_page: Int = 20
    var order_by: String?
    
    override init() {
        super.init()
        order_by = OrderBy.latest.rawValue
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        page <- map["page"]
        per_page <- map["per_page"]
        order_by <- map["order_by"]
    }
}
