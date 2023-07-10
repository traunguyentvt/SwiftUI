//
//  UserData.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI
import Combine

class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData, Never>()
    
    var notes = NoteData.shared.notes {
        didSet {
            objectWillChange.send(self)
            NoteData.shared.notes = notes
        }
    }
}
