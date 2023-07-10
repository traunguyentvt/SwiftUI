//
//  NoteList.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct NoteList: View {
    @EnvironmentObject var noteFactory: NoteFactory
    
    var body: some View {
        NavigationView {
            List(noteFactory.notes) { note in
                NavigationLink(destination: NoteDetail(note: note)) {
                    NoteRow(note: note)
                }
            }
                .navigationBarTitle(Text("Notes"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: self.createNote, label: { Text("New") }))
        }
//        .onAppear {
//            NoteData.shared.save()
//        }
    }
    
    private func createNote() {
        let newNote = Note(text: "New note " + String(noteFactory.notes.filter({$0.text.contains("New note")}).count))
        noteFactory.notes.insert(newNote, at: 0)
        NoteDAO.shared.save()
    }
}


#if DEBUG
struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList().environmentObject(NoteFactory())
    }
}
#endif
