//
//  NoteDetail.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct NoteDetail : View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var note: Note
    private var text: State<String>
    
    init(note: Note) {
        self.note = note
        self.text = .init(initialValue: note.text)
    }
    
    var noteIndex: Int {
        return userData.notes.firstIndex(where: {$0.id == note.id}) ?? 0
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
        .navigationBarTitle(Text(NoteData.convertDateToString(date: note.date, format: "MM-dd-yyyy")), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .onDisappear {
            NoteData.shared.save()
        }
    }
    
    private func updateNote() {
        userData.notes[noteIndex].text = text.wrappedValue
        userData.notes[noteIndex].updatedDate = Date()
    }
    
    private func deleteNote() {
        userData.notes.remove(at: noteIndex)
        NoteData.shared.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}


#if DEBUG
struct NoteDetail_Previews : PreviewProvider {
    static var previews: some View {
        NoteDetail(note: NoteData.shared.notes.first ?? Note())
    }
}
#endif
