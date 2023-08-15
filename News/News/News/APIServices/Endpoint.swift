//
//  Endpoint.swift
//  News
//
//  Created by VT on 8/13/23.
//

import SwiftUI

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem] { get }
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return Constant.API_HOST
    }
}
