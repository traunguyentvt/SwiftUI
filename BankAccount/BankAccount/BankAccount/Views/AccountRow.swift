//
//  AccountRow.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct AccountRow: View {
    
    let account: Account
    
    var numberFormat: NumberFormatter {
        let formatter = NumberFormatter()
//        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.numberStyle = NumberFormatter.Style.decimal
//        formatter.currencyCode = "$"
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(account.accountLabel ?? "")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text(account.accountNumber ?? "")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 15) {
                        let number = NSNumber(value: Double(account.currentBalance ?? "0") ?? 0)
                        Text("$"+(numberFormat.string(from: number) ?? ""))
                            .font(.title)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text("Available")
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack(spacing: 15) {
                        let number = NSNumber(value: Double(account.currentBalance ?? "0") ?? 0)
                        Text("$"+(numberFormat.string(from: number) ?? ""))
                            .font(.title)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text("Current")
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }

                Spacer()

                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 34, alignment: .center)
            }
            .padding()
            .background {
                Color.black.opacity(0.45)
            }
            .padding(.top, 50)
        }
        .background {
            ZStack{
                Rectangle()
                    .fill(Color(.gray))
//                    .aspectRatio(contentMode: .fill)
                
                Image(String(format: "background%d", account.index))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .scaledToFill()
                    .layoutPriority(-1)
            }
            .clipped()
        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: Account())
    }
}
