//
//  NoteDAO.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI

class NoteDAO {
    static let shared = NoteDAO()
    
    var notes: [Note] = [
        Note(text: "New note"),
        Note(text: "Another note")
    ]
    
    private init() {
        load()
    }
    
    static public func convertDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    private func load() {
        if let data = UserDefaults.standard.object(forKey: "notes_swiftui") as? Data {
            notes = try! PropertyListDecoder().decode([Note].self, from: data)
        }
    }
    
    public func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(notes), forKey: "notes_swiftui")
        NSLog("Notes saved")
    }
}
