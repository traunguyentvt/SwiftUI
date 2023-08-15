//
//  ServiceModel.swift
//  News
//
//  Created by VT on 8/13/23.
//

import Foundation

struct ServiceModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
