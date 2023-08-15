//
//  MockHttpClient.swift
//  NewsTests
//
//  Created by VT on 8/14/23.
//

import Foundation
@testable import News

final class MockHttpClient: Serviceable, Mockable {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func fetchAllNews(country: Country) async -> Result<ServiceModel, RequestError> {
        return await loadJson(fileName: fileName, extensionType: .json, responseModel: ServiceModel.self)
    }
    
    func fetchSearchedNews(query: String) async -> Result<ServiceModel, RequestError> {
        return await loadJson(fileName: fileName, extensionType: .json, responseModel: ServiceModel.self)
    }
    
    func fetchNewsByCategory(country: Country, category: String) async -> Result<ServiceModel, RequestError> {
        return await loadJson(fileName: fileName, extensionType: .json, responseModel: ServiceModel.self)
    }
}
