//
//  String.swift
//  GrowingTextView
//
//  Created by VT on 8/5/23.
//

import Foundation

extension Optional where Wrapped == String {
    var getText: String {
        self ?? ""
    }
}
