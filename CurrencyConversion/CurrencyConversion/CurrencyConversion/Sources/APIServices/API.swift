//
//  API.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation
import Alamofire
import ObjectMapper

enum API: String {
    case getLastest = "https://openexchangerates.org/api/latest.json"
    case emptyAPI = ""
    
    func post<T: RequestBase, R: ResponseBase>(request: T, domain: String, headers: HTTPHeaders? = nil, completed: @escaping((R?) -> Void)) {
        let url = domain + self.rawValue
        
        AF.request(url, method: .post, parameters: request.toJSON(), headers: headers)
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                    case .success(let dTypes):
//                    print(dTypes)
//                    case .failure(let error):
//                    print(error)
//                }
//            }
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
    
    func get<T: RequestBase, R: ResponseBase>(request: T, domain: String, headers: HTTPHeaders? = nil, completed: @escaping((R?) -> Void)) {
        let url = domain + self.rawValue
        
        AF.request(url, method: .get, parameters: request.toJSON(), headers: headers)
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                    case .success(let dTypes):
//                    print(dTypes)
//                    case .failure(let error):
//                    print(error)
//                }
//            }
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
}

enum APIResult: Int {
    case failed = 0
    case success = 1
    case other = -9999
}
