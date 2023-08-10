//
//  SummaryView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct SummaryView: View {
    
//    @ObservedObject var viewModel: AccountModelView = AccountModelView()
    @EnvironmentObject var accountModelView: AccountModelView
    @Binding var tabBarIndex: Int
    @Binding var selectedAccount: Account?
    
    init(tabBarIndex: Binding<Int>, selectedAccount: Binding<Account?>) {
        UINavigationBar.appearance().backgroundColor = .gray
        self._tabBarIndex = tabBarIndex
        self._selectedAccount = selectedAccount
        
//        viewModel.loadData()
    }
    
    var body: some View {
//        NavigationView {
        VStack {
            HeaderView(title: "Summary")
            List {
//            ScrollView {
                ForEach(accountModelView.accounts) { account in
//                    NavigationLink(destination: SummaryDetailView(account: account)) {
                        AccountRow(account: account)
                        .onTapGesture {
                            tabBarIndex = 1
                            selectedAccount = account
                        }
//                    }
                }
                .edgesIgnoringSafeArea(.all)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
            }
            .padding(.top, -10)
            .listStyle(.plain)
//            .navigationBarTitle("Summary", displayMode: .large)
//            .navigationViewStyle(DefaultNavigationViewStyle())
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: customLeftMenu, trailing: customRightMenu)
        }
//        .edgesIgnoringSafeArea(.all)
    }
    
//    var customLeftMenu: some View {
//        Button {
//
//        } label: {
//            HStack(spacing: 10) {
//                Image(systemName: "plus")
//                    .font(.system(size: 20))
//                Text("Home")
//                    .font(.system(size: 20))
//            }
//        }
//    }
//
//    var customRightMenu: some View {
//        Button {
//
//        } label: {
//            Image(systemName: "plus")
//                .font(.system(size: 20))
//        }
//    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(tabBarIndex: .constant(0), selectedAccount: .constant(nil))
    }
}
