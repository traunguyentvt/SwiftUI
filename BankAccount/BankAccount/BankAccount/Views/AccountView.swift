//
//  AccountView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct AccountView: View, AccountHeaderViewDelegate {
    @EnvironmentObject var accountModelView: AccountModelView
    @Binding var account: Account?
    @State var transactions: [Transaction] = []
    var dateFormatter = DateFormatter()
    
    init(account: Binding<Account?>) {
        self._account = account
    }
    
    var body: some View {
        VStack {
            HeaderView(title: "Accounts")
            
            if let account = account {
//                ScrollView(.horizontal) {
//                    LazyHStack {
//                        ForEach(accountModelView.accounts) { item in
//                            AccountHeaderView(account: item)
//                        }
//                        .frame(width: UIScreen.main.bounds.width)
//                    }
//                }
                AccountHeaderView(delegate: self, account: account)
                    .padding(.top, -8)
                
                List {
                    ForEach(groupByDate(transactions: transactions), id: \.0) { pair in
                        Section {
                            ForEach(pair.1) { item in
                                TransactionRow(transaction: item)
                            }
                        } header: {
                            Text(displayDay(input: pair.0))
                        }
                    }
                }
                .listStyle(.plain)
                .padding(.top, -8)
                .background(Color.white)
            }
        }
        .onAppear {
            updateAccount()
            loadData()
        }
    }
    
    func groupByDate(transactions: [Transaction]) -> [(String, [Transaction])] {
        let group = Dictionary(grouping: transactions, by: { $0.dateString ?? "" })
        return group.sorted(by: { $0.key > $1.key })
    }
    
    func displayDay(input: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: input) ?? Date()
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func updateAccount() {
        if account == nil {
            let accounts = accountModelView.accounts
            account = accounts.first
        }
    }
    
    func loadData() {
        if let account = account, let transaction = account.transactions {
            AccountFactory.instance.getAccountTransactions(url: transaction) { response, error in
                self.transactions = response?.transactions ?? []
            }
        }
    }
    
    func next() {
        let accounts = accountModelView.accounts
        var index = accounts.firstIndex(where: { $0.accountNumber == account?.accountNumber }) ?? 0
        if index < accounts.count - 1 {
            index += 1
        } else {
            index = 0
        }
        
        account = accounts[index]
        loadData()
    }
    
    func previous() {
        let accounts = accountModelView.accounts
        var index = accounts.firstIndex(where: { $0.accountNumber == account?.accountNumber }) ?? 0
        if index > 0 {
            index -= 1
        } else {
            index = accounts.count - 1
        }
        
        account = accounts[index]
        loadData()
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: .constant(Account()))
    }
}
