//
//  Note.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct Note : Identifiable, Encodable, Decodable {
    var id = UUID()
    var text: String = ""
    var date: Date = Date()
    var updatedDate: Date = Date()
}
