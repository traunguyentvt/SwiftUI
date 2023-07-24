//
//  Navigation_SwiftUIApp.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

@main
struct Navigation_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NavigationModel())
        }
    }
}
