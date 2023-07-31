//
//  ReadingData.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct ReadingData: Identifiable, Equatable, Codable {
    let url: URL?
    let title: String
    let creationDate: Date
    var hasFinishedReading: Bool
    var id: Date {
        return creationDate
    }
    
    static func createExamples() -> ReadingData {
        ReadingData(url: URL(string: "https://www.apple.com/"), title: "Apple", creationDate: Date(), hasFinishedReading: false)
    }
}
