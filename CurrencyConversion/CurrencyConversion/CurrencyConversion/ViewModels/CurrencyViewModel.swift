//
//  CurrencyViewModel.swift
//  CurrencyConversion
//
//  Created by VT on 8/11/23.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    
    @Published var currencies: [String: Float] = [:]
    @Published var currentCurrency: String = ""
    
    init() {
        loadData()
    }
    
    func loadData() {
        if currencies.count > 0 {
            return
        }
        
        CurrencyFactory.instance.getLastest() { [weak self] response, error in
            self?.currencies = response?.rates ?? [:]
            self?.currentCurrency = response?.base ?? "USD"
        }
    }
}
