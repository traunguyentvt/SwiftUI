//
//  Date+Helper.swift
//  PayPayCoding
//
//  Created by Shujat Ali on 30/07/2023.
//

import Foundation

extension Date {
    var minute: Int { Calendar.current.component(.minute, from: self) }
    var nextHalfHour: Date {
        Calendar.current.nextDate(after: self, matching: DateComponents(minute: minute >= 30 ? 0 : 30), matchingPolicy: .strict)!
    }
    
    func minutes(from date: Date) -> Int {
            return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
}
