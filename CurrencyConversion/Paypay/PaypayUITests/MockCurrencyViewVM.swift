//
//  MockCurrencyViewVM.swift
//  PayPayCodingTests
//
//  Created by Shujat Ali on 29/07/2023.
//

import Foundation


class MockCurrencyViewVM: CurrencyViewVM {
    
    override func fetchCurrencies() {
        do {
            if let jsonData =  readLocalJson("currencies") {
                let obj = try JSONDecoder().decode([String: String].self, from: jsonData)
                self.currencies = obj.map { elem in CurrencyData(item: elem) }
                    .sorted { o1, o2 in
                        o1.name < o2.name
                    }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func fetchRates() {
        do {
            filterRates.removeAll()
            if let jsonData =  readLocalJson("latest") {
                let obj = try JSONDecoder().decode(CurrencyResponse.self, from: jsonData)
                self.rates = (obj.rates ?? [:])
                .map {
                    CurrencyRateItem($0)
                }.sorted { o1, o2 in
                    o1.ccy < o2.ccy
                }.map {
                    let item = $0
                    self.filterRates.append(item)
                    return item
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func readLocalJson(_ file: String) -> Data? {
        do {
            guard let fileURL = Bundle.main.url(forResource: file, withExtension: "json") else {
                return nil
            }
            
            let data = try Data(contentsOf: fileURL)
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
