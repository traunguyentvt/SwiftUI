//
//  TransactionRow.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var numberFormat: NumberFormatter {
        let formatter = NumberFormatter()
//        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.numberStyle = NumberFormatter.Style.decimal
//        formatter.currencyCode = "$"
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        HStack {
            Text(transaction.description ?? "")
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            let number = getNumber(number: transaction.amount ?? 0)
            let signed = getSigned(number: transaction.amount ?? 0)
            let tempNumber = NSNumber(value: number)
            
            Text(signed + "$" + (numberFormat.string(from: tempNumber) ?? ""))
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
        }
    }
    
    func getNumber(number: Double) -> Double {
        if number < 0 {
            return -number
        }
        return number
    }
    
    func getSigned(number: Double) -> String {
        if number < 0 {
            return "-"
        }
        return ""
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction())
    }
}
