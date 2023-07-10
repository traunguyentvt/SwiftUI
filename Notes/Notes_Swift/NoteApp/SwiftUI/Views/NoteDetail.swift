//
//  NoteDetail.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct NoteDetail: View {
    @EnvironmentObject var noteFactory: NoteFactory
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var note: Note
    private var text: State<String>
    
    init(note: Note) {
        self.note = note
        self.text = .init(initialValue: note.text)
    }
    
    var noteIndex: Int {
        return noteFactory.notes.firstIndex(where: {$0.id == note.id}) ?? 0
    }
    
    var btnBack: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("btnBack").aspectRatio(contentMode: .fit).foregroundColor(.white)
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Note description", text: text.projectedValue, onEditingChanged: {_ in self.updateNote()}, onCommit: {})
            Button(action: self.deleteNote, label: {Text("Delete")})
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(NoteDAO.convertDateToString(date: note.date, format: "MM-dd-yyyy")), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .onDisappear {
            NoteDAO.shared.save()
        }
    }
    
    private func updateNote() {
        noteFactory.notes[noteIndex].text = text.wrappedValue
        noteFactory.notes[noteIndex].updatedDate = Date()
    }
    
    private func deleteNote() {
        noteFactory.notes.remove(at: noteIndex)
        NoteDAO.shared.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}


#if DEBUG
struct NoteDetail_Previews : PreviewProvider {
    static var previews: some View {
        NoteDetail(note: NoteDAO.shared.notes.first ?? Note())
    }
}
#endif
