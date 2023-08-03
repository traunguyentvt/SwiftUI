//
//  EnumAPI.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import UIKit
import Alamofire
import ObjectMapper

enum API: String {
    case getPhotos = "/photos"
    
    func post<T: RequestBase, R: ResponseBase>(request: T, domain: String, headers: HTTPHeaders? = nil, completed: @escaping((R?) -> Void)) {
        let url = domain + self.rawValue
        
        AF.request(url, method: .post, parameters: request.toJSON(), headers: headers)
            .responseJSON{ response in
                switch response.result {
                case let .success(value):
                    let responseObj = Mapper<R>().map(JSONObject: value)
                    completed(responseObj)
                    
                    break
                    
                case let .failure(error):
                    print("Error " + url + ": " + error.localizedDescription)
                    let response = Mapper<R>().map(JSONObject: ["result": APIResult.other.rawValue, "msg": "Something wrong happens"])
                    completed(response)
                    
                    break
                    
                }
        }
    }
    
    func get<T: RequestBase>(request: T, domain: String, headers: HTTPHeaders? = nil, completed: @escaping((ResponseBase?) -> Void)) {
        let url = domain + self.rawValue
        
        AF.request(url, method: .get, parameters: request.toJSON(), headers: headers)
            .responseJSON{ response in
                switch response.result {
                case let .success(value):
                    var res = ResponseBase()
                    if let datas = value as? [[String : Any]] {
                        res.data = Mapper<PhotoDTO>().mapArray(JSONArray: datas)
                        res.result = 1
                    } else {
                        res = Mapper<ResponseBase>().map(JSONObject: value) ?? ResponseBase()
                    }
                    completed(res)
                    
                    break
                    
                case let .failure(error):
                    print("Error " + url + ": " + error.localizedDescription)
                    let response = Mapper<ResponseBase>().map(JSONObject: ["result": APIResult.other.rawValue, "msg": "Something wrong happens"])
                    completed(response)
                    
                    break
                    
                }
        }
    }
}

enum APIResult: Int {
    case failed = 0
    case success = 1
    case other = -9999
}

enum OrderBy: String {
    case latest
    case oldest
    case popular
}
