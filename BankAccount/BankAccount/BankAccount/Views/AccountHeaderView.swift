//
//  AccountHeaderView.swift
//  BankAccount
//
//  Created by VT on 8/9/23.
//

import SwiftUI

protocol AccountHeaderViewDelegate {
    func next()
    func previous()
}

struct AccountHeaderView: View {
    
    var delegate: AccountHeaderViewDelegate?
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
                Text("")
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("questionmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34)
                        
                }
            }
            .padding(.top, 15)
            .padding(.trailing, 15)
            
            HStack {
                Button(action: self.btnPrevious, label: {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34, alignment: .center)
                })
                
//                Spacer()
                
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
                    
//                    HStack(spacing: 15) {
//                        let number = NSNumber(value: Double(account.currentBalance ?? "0") ?? 0)
//                        Text("$"+(numberFormat.string(from: number) ?? ""))
//                            .font(.title)
//                            .foregroundColor(.white)
//                            .multilineTextAlignment(.leading)
//
//                        Text("Current")
//                            .font(.body)
//                            .foregroundColor(.white)
//                            .multilineTextAlignment(.leading)
//                    }
                }

                Spacer()

                Button(action: self.btnNext, label: {
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34, alignment: .center)
                })
            }
            .padding()
            .background {
                Color.black.opacity(0.45)
            }
            .padding(.top, 25)
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
    
    func btnNext() {
        delegate?.next()
    }
    
    func btnPrevious() {
        delegate?.previous()
    }
}

struct AccountHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHeaderView(account: Account())
    }
}
