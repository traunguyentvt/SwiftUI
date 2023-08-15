//
//  Serviceable.swift
//  News
//
//  Created by VT on 8/13/23.
//

import SwiftUI

protocol Serviceable {
    func fetchAllNews(country: Country) async -> Result<ServiceModel, RequestError>
    func fetchSearchedNews(query: String) async -> Result<ServiceModel, RequestError>
    func fetchNewsByCategory(country: Country, category: String) async -> Result<ServiceModel, RequestError>
}

struct APIService: HTTPClient, Serviceable {
    func fetchAllNews(country: Country) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endPoint: NewsEndpoint.allNews(country: country), responseModel: ServiceModel.self)
    }
    
    func fetchSearchedNews(query: String) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endPoint: NewsEndpoint.searchNews(query: query), responseModel: ServiceModel.self)
    }
    
    func fetchNewsByCategory(country: Country, category: String) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endPoint: NewsEndpoint.newsByCategory(category: category, country: country), responseModel: ServiceModel.self)
    }
}
