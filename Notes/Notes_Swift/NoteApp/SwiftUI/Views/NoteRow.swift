//
//  NoteRow.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct NoteRow: View {
    var note: Note
    
    var body: some View {
        VStack {
            Text(note.text + "\n" + NoteDAO.convertDateToString(date: note.updatedDate, format: "dd:mm:ss"))
        }
    }
}

#if DEBUG
struct NoteRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NoteRow(note: Note(text: "New Note"))
            NoteRow(note: Note(text: "Another Note"))
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
#endif
