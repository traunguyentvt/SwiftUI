//
//  NoteFactory.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI
import Combine

class NoteFactory: ObservableObject {
    let objectWillChange = PassthroughSubject<NoteFactory, Never>()
    
    var notes = NoteDAO.shared.notes {
        didSet {
            objectWillChange.send(self)
            NoteDAO.shared.notes = notes
        }
    }
}
