//
//  CurrencyConversionApp.swift
//  CurrencyConversion
//
//  Created by VT on 8/10/23.
//

import SwiftUI

@main
struct CurrencyConversionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
