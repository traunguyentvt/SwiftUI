//
//  String+Extensions.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation

extension String {
    func calculateTime() -> String {
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "en_US_POSIX")
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormat.date(from: self) else {
            return ""
        }
        let calculatedTime = abs(date.hours(from: .now))
        if calculatedTime > 24 {
            return "\(abs(date.days(from: .now))) days"
        }
        return "\(calculatedTime) hours"
    }
    
    func isInValid() -> Bool {
        if self.first == " " {
            return true
        }
        return false
    }
}
