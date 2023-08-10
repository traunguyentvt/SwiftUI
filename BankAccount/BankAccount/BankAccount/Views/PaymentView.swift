//
//  PaymentView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack {
            HeaderView(title: "Payments")
            Spacer()
            Text("Payments View")
            Spacer()
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
