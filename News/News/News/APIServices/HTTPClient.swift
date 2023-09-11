//
//  HTTPClient.swift
//  News
//
//  Created by VT on 8/13/23.
//

import SwiftUI

protocol HTTPClient {
    func sendRequest<T: Decodable>(endPoint: EndPoint, responseModel: T.Type, urlSession: URLSession?) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endPoint: EndPoint, responseModel: T.Type, urlSession: URLSession? = nil) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.queryItems
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        
        if let body = endPoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
//            URLSession.shared.configuration.requestCachePolicy = .useProtocolCachePolicy
            var dataResponse: (Data, URLResponse)?
            if let session = urlSession {
                dataResponse = try await session.data(for: request, delegate: nil)
            } else {
                dataResponse = try await URLSession.shared.data(for: request, delegate: nil)
            }
            
            guard let response = dataResponse?.1 as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let data = dataResponse?.0 else {
                    return .failure(.unknown)
                }
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
                
            case 400:
                return .failure(.unauthorized)
                
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
