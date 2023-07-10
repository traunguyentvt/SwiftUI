//
//  NodeData.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

class NoteData {
    static let shared = NoteData()
    
    var notes: [Note] = [
        Note(text: "New note", date: Date()),
        Note(text: "Another note", date: Date())
    ]
    
    private init() {
        load()
    }
    
    static func convertDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(notes), forKey: "notes_swiftui")
        NSLog("Notes saved")
    }
    
    func load() {
        if let data = UserDefaults.standard.object(forKey: "notes_swiftui") as? Data {
            notes = try! PropertyListDecoder().decode([Note].self, from: data)
        }
    }
    
}
