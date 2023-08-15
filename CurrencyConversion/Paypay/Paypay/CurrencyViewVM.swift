//
//  CurrencyViewVM.swift
//  PayPayCoding
//
//  Created by Shujat Ali on 29/07/2023.
//

import Foundation
import Combine


class CurrencyViewVM: ObservableObject {
 
    let BASE_URL = "https://openexchangerates.org/api/"
    let API_RATES = "latest.json"
    let API_CURRENCIES = "currencies.json"
    let REFRESH_TIME = 30
    
    let APP_ID = "d10c07280ca4454cb968f47e57d7a707"
    
    @Published var rates = [CurrencyRateItem]()
    @Published var filterRates = [CurrencyRateItem]()
    @Published var currencies = [CurrencyData]()
    
    var inputCCy: String = "1" {
        didSet {
            applyFilter(selectedCCY.ccy)
        }
    }
    
    @Published var selectedCCY = CurrencyData()
    
    private var searchCancellable = Set<AnyCancellable>()
    
    var inputAmount: String {
        return inputCCy + "(\(selectedCCY.ccy)"
    }
    

    deinit {
        searchCancellable.forEach {
            $0.cancel()
        }
    }
    
    func initCommon() {
        fetchCurrencies()
        fetchRates()
    }
    
    func applyFilter(_ ccy: String) {
        if let item = rates.first(where: { $0.ccy == ccy }) {
            let rate = (Double(inputCCy) ?? 1) / item.rate
            filterRates = rates.map {
                return CurrencyRateItem($0, rate)
            }
        }
    }
    
    func updateTime(_ hasResponse: Bool) {
        if hasResponse && Date().minutes(from: UserDefaultHelper.lastFetch) >= self.REFRESH_TIME {
            UserDefaultHelper.lastFetch = Date()
        }
    }
    
    private func isLimitAvailable()  {
        print(Date().minutes(from: UserDefaultHelper.lastFetch))
        //caching allowed only for 30 minutes
        if Date().minutes(from: UserDefaultHelper.lastFetch) >= REFRESH_TIME {
            URLSession.shared.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            URLSession.shared.configuration.urlCache = nil
        }
    }
    
    //MARK: - API's
    
    func fetchCurrencies() {
        isLimitAvailable()
            let urlComponents = URLComponents(string: BASE_URL + API_CURRENCIES)!
            var request = URLRequest(url: urlComponents.url!)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap({ element -> [CurrencyData] in
                    guard let response = element.response as? HTTPURLResponse,
                                        (200...299).contains(response.statusCode) else {
                                    throw URLError(.badServerResponse)
                                }
                    do {
                        //if let strData = String(data: element.data, encoding: .utf8) {
                            //UserDefaultHelper.currencyResponse = strData
                            let jData = try JSONDecoder().decode([String: String].self, from: element.data)
                            return jData.map { elem in CurrencyData(item: elem) }
                                .sorted { o1, o2 in
                                    o1.name < o2.name
                                }
                        
                    } catch {
                        throw URLError(.cannotDecodeRawData)
                    }
                })
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { status in
                    switch status {
                                    case .finished:
                                        print("Completed")
                                        break
                                    case .failure(let error):
                                        print("Receiver error \(error)")
                                        break
                                    }
                }, receiveValue: { response in
                    self.currencies = response
                    self.updateTime(!response.isEmpty)
                    
                })
                .store(in: &searchCancellable)
//        }
    }
    
    func fetchRates() {
        isLimitAvailable()
            var urlComponents = URLComponents(string: BASE_URL + API_RATES)!
            urlComponents.queryItems = [
                URLQueryItem(name: "app_id", value: APP_ID)
                //,
                //URLQueryItem(name: "base", value: "USD") //Free version cannot change base currency
            ]

            var request = URLRequest(url: urlComponents.url!)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            filterRates.removeAll()

            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap({ element -> [CurrencyRateItem] in
                    guard let response = element.response as? HTTPURLResponse,
                                        (200...299).contains(response.statusCode) else {
                                    throw URLError(.badServerResponse)
                                }
                    do {
                        //if let strData = String(data: element.data, encoding: .utf8) {
                            //UserDefaultHelper.ratesResponse = strData
                            let jData = try JSONDecoder().decode(CurrencyResponse.self, from: element.data)
                            return (jData.rates ?? [:]).map { CurrencyRateItem($0) }
                                .sorted { o1, o2 in  o1.ccy < o2.ccy }
                        
                    } catch {
                        throw URLError(.cannotDecodeRawData)
                    }
                })
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { status in
                    switch status {
                                    case .finished:
                                        print("Completed")
                                        break
                                    case .failure(let error):
                                        print("Receiver error \(error)")
                                        break
                                    }
                }, receiveValue: { response in
                    self.filterRates.append(contentsOf: response)
                    self.rates = response
                    self.updateTime(!response.isEmpty)
                })
                .store(in: &searchCancellable)
    }
}

