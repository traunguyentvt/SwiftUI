//
//  NoteRow.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct NoteRow : View {
//    @EnvironmentObject var userData: UserData
    
    var note: Note
    var body : some View {
        VStack {
            Text(note.text + "\n" + NoteData.convertDateToString(date: note.updatedDate, format: "dd:mm:ss"))
//            Button(action: self.deleteNote, label: {Text("Delete")})
        }
    }
    
//    private func deleteNote() {
//        userData.notes.removeAll(where: {$0.id == note.id})
//    }
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
