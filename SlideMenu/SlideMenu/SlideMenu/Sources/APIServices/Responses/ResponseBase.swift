//
//  ResponseBase.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import UIKit
import ObjectMapper

class ResponseBase: Mappable {
    
    public var result: Int?
    public var msg: String?
    
    public var data: [PhotoDTO]?
    
    public init(){}
    
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        result <- (map["result"], IntStringTransform())
        msg <- map["msg"]
    }
    
}

class IntStringTransform: TransformType {
    init() {
    }
    
    public func transformFromJSON(_ value: Any?) -> Int? {
        let str = value as? String
        let str2 = value as? Int
        return str?.intValue ?? str2
    }
    
    public func transformToJSON(_ value: Int?) -> String? {
        return value?.stringValue
    }
    
    public typealias Object = Int
    public typealias JSON = String
}

public class StringIntTransform: TransformType {
    init() {
    }
    
    public func transformFromJSON(_ value: Any?) -> String? {
        let str = value as? String
        let str2 = value as? Int
        return str ?? str2?.stringValue
    }
    
    public func transformToJSON(_ value: String?) -> String? {
        return value
    }
    
    public typealias Object = String
    public typealias JSON = String
}
