//
//  ContentView.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List(userData.notes) { note in
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
        let newNote = Note(text: "New note " + String(userData.notes.filter({$0.text.contains("New note")}).count))
        userData.notes.insert(newNote, at: 0)
        NoteData.shared.save()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
#endif
