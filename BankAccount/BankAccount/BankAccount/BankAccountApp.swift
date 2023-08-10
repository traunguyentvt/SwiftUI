//
//  BankAccountApp.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

@main
struct BankAccountApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(AccountModelView())
        }
    }
}
