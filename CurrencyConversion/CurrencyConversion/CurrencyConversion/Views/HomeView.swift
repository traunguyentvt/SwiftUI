//
//  HomeView.swift
//  CurrencyConversion
//
//  Created by VT on 8/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var inputText: Float = 1.0
    @State private var selectedCurrency = "USD"
    @StateObject private var currencyViewModel = CurrencyViewModel()
    
//    let dummyData = (1...100).map { "VT \($0)" }
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            TextField("1", value: $inputText, formatter: numberFormat)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .frame(height: 40)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            let keys = getKeys()
            HStack() {
                Text("")

                Spacer()
                
                if keys.count > 0 {
                    HStack {
                        Picker("Currency Category", selection: $selectedCurrency) {
                            ForEach(keys, id: \.self) { item in
                                Text(item)
                                    .tag(item)
                            }
                        }
                        
                        Image("icon_expand")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                    }
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .border(.gray, width: 1)
                }
                
//                Button {
//
//                } label: {
//                    HStack {
//                        Text(currencyViewModel.currentCurrency)
//                            .foregroundColor(.gray)
//                        Image("icon_expand")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 16, height: 16)
//                    }
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 20)
//                    .padding(.trailing, 20)
//                    .border(.gray, width: 1)
//                }
//                .padding(.top, 8)
//                .padding(.trailing, 20)
            }
            .padding(.top, 1)
            .padding(.trailing, 20)
            
            let currentConversion = currencyViewModel.currencies[selectedCurrency] ?? 1.0
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(keys, id: \.self) { item in
                        VStack {
                            Text(item)
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            let input = inputText / currentConversion
                            let value = NSNumber(value: input * (currencyViewModel.currencies[item] ?? 0.0))
                            if value != 0 {
                                Text(numberFormat.string(from: value) ?? "")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(.cyan)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            }
            .padding(.top, 20)
        }
    }
    
    func getKeys() -> [String] {
        var result = [String]()
        let keys = currencyViewModel.currencies.keys
        for key in keys {
            result.append(key)
        }
        return result.sorted()
    }
    
    var numberFormat: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.maximumFractionDigits = 5
        return formatter
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
