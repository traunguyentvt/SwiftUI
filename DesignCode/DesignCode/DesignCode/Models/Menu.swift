//
//  Menu.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import Foundation

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    
    static func MenuData() -> [Menu] {
        [
            Menu(title: "My Account", icon: "person.crop.circle"),
            Menu(title: "Settings", icon: "gear"),
            Menu(title: "Billing", icon: "creditcard"),
            Menu(title: "Team", icon: "person.2"),
            Menu(title: "Sign out", icon: "arrow.uturn.down")
        ]
    }
}
