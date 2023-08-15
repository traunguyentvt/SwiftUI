//
//  Currency.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation

struct Currency: Identifiable {
    let id = UUID()
    var name: String
    var conversion: String
}
