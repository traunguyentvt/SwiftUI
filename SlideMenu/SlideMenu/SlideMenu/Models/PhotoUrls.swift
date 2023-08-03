//
//  PhotoUrls.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import ObjectMapper

class PhotoUrls: Mappable {
    
    var small: String?
    var small_s3: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        small <- (map["small"], StringIntTransform())
        small_s3 <- (map["small_s3"], StringIntTransform())
    }
}
