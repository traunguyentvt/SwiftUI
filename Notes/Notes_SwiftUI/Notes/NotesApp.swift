//
//  NotesApp.swift
//  Notes
//
//  Created by VT on 7/9/23.
//

import SwiftUI

@main
struct NotesApp: App {
//    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserData())
        }
//        .onChange(of: scenePhase) { phase in
//            switch(phase) {
//            case .background:
//                NoteData.shared.save()
//            case .inactive:
//                break
//            case .active:
//                break
//            @unknown default:
//                break
//            }
//        }
    }
}
