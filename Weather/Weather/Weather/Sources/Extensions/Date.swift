//
//  Date.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import Foundation

extension Date {
    func formatter(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
