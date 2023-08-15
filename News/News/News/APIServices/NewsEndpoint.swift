//
//  NewsEndpoint.swift
//  News
//
//  Created by VT on 8/13/23.
//

import Foundation

enum NewsEndpoint {
    case allNews(country: Country)
    case searchNews(query: String)
    case newsByCategory(category: String, country: Country)
}

extension NewsEndpoint: EndPoint {
    var path: String {
        switch self {
        case .searchNews:
            return "/v2/everything"
        case .allNews, .newsByCategory:
            return "/v2/top-headlines"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .allNews, .searchNews, .newsByCategory:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .allNews, .newsByCategory, .searchNews:
            return [
                "Authorization": "Bearer \(Constant.ACCESS_TOKEN)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .allNews, .newsByCategory, .searchNews:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .allNews(let country):
            return [URLQueryItem(name: "country", value: country.code)]
        case .searchNews(let query):
            return [URLQueryItem(name: "q", value: query)]
        case .newsByCategory(let category, let country):
            return [
                URLQueryItem(name: "country", value: country.code),
                URLQueryItem(name: "category", value: category)
            ]
        }
    }
}
