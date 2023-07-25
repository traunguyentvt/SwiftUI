//
//  DetailView.swift
//  Toolbar_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct DetailView: View {
    
    @State private var showNavigation = false
    @State private var showNavigationLeading = false
    @State private var showNavigationTrailing = false
    @State private var showPrinciple = false
    @State private var showPrimaryAction = true
    @State private var showBottomBar = true
    
    var body: some View {
        VStack {
            Toggle("navigation", isOn: $showNavigation)
                .foregroundColor(.blue)
            Toggle("navigationBarLeading", isOn: $showNavigationLeading)
                .foregroundColor(.red)
            Toggle("navigationBarTrailing", isOn: $showNavigationTrailing)
            Toggle("principle", isOn: $showPrinciple)
            Toggle("primaryAction", isOn: $showPrimaryAction)
            Toggle("showBottomBar", isOn: $showBottomBar)
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                if showNavigation {
                    Text("Navigation")
                        .foregroundColor(.blue)
                }
            }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                if showNavigationLeading {
                    Text("NavigationBarLeading")
                        .foregroundColor(.red)
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if showNavigationTrailing {
                    Text("NavigationBarTrailing")
                        .foregroundColor(.yellow)
                        .border(.green)
                }
            }
            ToolbarItemGroup(placement: .principal) {
                if showPrinciple {
                    Text("Principle")
                        .foregroundColor(.orange)
                }
            }
            ToolbarItemGroup(placement: .primaryAction) {
                if showPrimaryAction {
                    Text("PrimaryAction")
                        .foregroundColor(.cyan)
                }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                if showBottomBar {
                    Text("Johnny")
                        .foregroundColor(.blue)
                    Spacer()
                    Text("V")
                        .foregroundColor(.red)
                    Spacer()
                    Text("T")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
