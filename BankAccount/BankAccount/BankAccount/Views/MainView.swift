//
//  MainView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct MainView: View {
    
    @State var tabBarIndex: Int = 0
    @State var selectedAccount: Account?
    
    init() {
        UITabBar.appearance().backgroundColor = .gray
    }
    
    var body: some View {
        TabView(selection: $tabBarIndex) {
            SummaryView(tabBarIndex: $tabBarIndex, selectedAccount: $selectedAccount)
                .tag(0)
                .tabItem {
                    HStack(spacing: 7) {
                        
                        Image(tabBarIndex == 0 ? "active_list" : "inactive_list")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Summary")
                    }
                }
            
            AccountView(account: $selectedAccount)
                .tag(1)
                .tabItem {
                    HStack(spacing: 7) {
                        Image(tabBarIndex == 1 ? "active_account" : "inactive_account")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Accounts")
                    }
                }
            
            PaymentView()
                .tag(2)
                .tabItem {
                    HStack(spacing: 7) {
                        Image(tabBarIndex == 2 ? "active_payment" : "inactive_payment")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Payments")
                    }
                }
        }
//        .environmentObject(AccountModelView())
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
