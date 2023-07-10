//
//  Note.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct Note: Identifiable, Encodable, Decodable {
    var id = UUID()
    var date = Date()
    var updatedDate = Date()
    var text = ""
}
