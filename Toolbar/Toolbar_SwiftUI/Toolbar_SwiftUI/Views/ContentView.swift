//
//  ContentView.swift
//  Toolbar_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Johnny V")
                NavigationLink("VT", destination: DetailView())
                NavigationLink("Keyboard", destination: KeyboardView())
            }
            .padding()
            .toolbar(id: "toolbar", content: {
                ToolbarItem(id: "navigation", placement: .navigation, showsByDefault: true) {
                    Text("Navigation")
                }
                ToolbarItem(id: "status", placement: .status, showsByDefault: true) {
                    Label("Status", systemImage: "person.circle")
                }
                ToolbarItem(id: "primary", placement: .primaryAction, showsByDefault: true) {
                    Label("Primary", systemImage: "star")
                        .foregroundColor(.red)
                }
            })
        }
        .navigationTitle("Toolbar")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
