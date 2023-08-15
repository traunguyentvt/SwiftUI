//
//  Mockable.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation
@testable import News

enum FileExtensionType: String {
    case json = ".json"
}

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    
    func loadJson<T: Decodable>(fileName: String, extensionType: FileExtensionType, responseModel: T.Type) async -> Result<T, RequestError>
}

extension Mockable {
    var bundle: Bundle {
        Bundle(for: type(of: self))
    }
    
    func loadJson<T: Decodable>(fileName: String, extensionType: FileExtensionType, responseModel: T.Type) async -> Result<T, RequestError> {
        guard let filePath = bundle.url(forResource: fileName, withExtension: extensionType.rawValue) else {
            return .failure(.invalidURL)
        }
        do {
            let data = try Data(contentsOf: filePath)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedObject)
        } catch {
            return .failure(.unknown)
        }
    }
}
