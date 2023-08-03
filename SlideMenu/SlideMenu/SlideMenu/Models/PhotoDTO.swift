//
//  PhotoDTO.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import ObjectMapper

class PhotoDTO: Mappable, Identifiable {
    var id: String?
    var createdAt: Date?
    var updatedAt: Date?
    var width: Int?
    var height: Int?
    var color: String?
    var description: String?
    var alt_description: String?
    var likes: Int?
    var likedByUser: Bool?
    var urls: PhotoUrls?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- (map["id"], StringIntTransform())
        width <- (map["width"], IntStringTransform())
        height <- (map["height"], IntStringTransform())
        color <- (map["color"], StringIntTransform())
        description <- (map["description"], StringIntTransform())
        alt_description <- (map["alt_description"], StringIntTransform())
        likes <- (map["likes"], IntStringTransform())
        urls <- map["urls"]
    }
}
