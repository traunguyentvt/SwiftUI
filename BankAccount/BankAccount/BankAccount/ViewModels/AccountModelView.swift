//
//  AccountModelView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import Foundation

class AccountModelView: ObservableObject {
    
//    static let shared = AccountModelView()
    
    @Published var accounts: [Account] = []
    
    init() {
//        accounts = Account.AccountData()
        loadData()
    }
    
    func loadData() {
        if accounts.count > 0 {
            return
        }
        
        SummaryFactory.instance.getSummaries() { [weak self] response, error in
//            self?.accounts = response?.accounts ?? []
            if let list = response?.accounts {
                var index = 0
                for item in list {
                    if index > 4 {
                        index = 0
                    }
                    item.index = index
                    self?.accounts.append(item)
                    index += 1
                }
            }
        }
    }
}
