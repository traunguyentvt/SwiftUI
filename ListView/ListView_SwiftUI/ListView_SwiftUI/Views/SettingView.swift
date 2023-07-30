//
//  SettingView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/29/23.
//

import SwiftUI

enum AppearanceStyle {
    case dark
    case light
    case auto
}

struct SettingView: View {
    
    @State private var username: String = ""
    @State private var isPrivate: Bool = true
    @State private var profileImageSize: Bool = false
    @State private var fontSize: CGFloat = 10
    @State private var appearance: AppearanceStyle = .auto
    
    var body: some View {
//        List {
        Form {
            Section {
                TextField("Username", text: $username)
                Toggle("Private account", isOn: $isPrivate)
                Button {
                    
                } label: {
                    Text("Sign out")
                }
            } header: {
                Text("Profile")
            } footer: {
                
            }
            
            Section {
                Slider(value: $fontSize, in: 7...20) {
//                    Label("Default font size", systemImage: "text.magnifyingglass")
//                        .font(.system(size: fontSize))
                }
                
                Picker("Appearance", selection: $appearance) {
                    Text("Dark")
                        .tag(AppearanceStyle.dark)
                    Text("Light")
                        .tag(AppearanceStyle.light)
                    Text("Auto")
                        .tag(AppearanceStyle.auto)
                }
            } header: {
                Text("Appearance")
            } footer: {
                
            }
            
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("YE.VT")
                }
            } header: {
                Text("About")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
