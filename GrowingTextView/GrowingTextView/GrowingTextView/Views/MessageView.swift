//
//  MessageView.swift
//  GrowingTextView
//
//  Created by VT on 8/5/23.
//

import SwiftUI

struct MessageView: View {
    
    var message: String?
    
    var body: some View {
        Text(message ?? "")
            .foregroundColor(.white)
            .padding(.all, 12)
            .background(Color.messageBackground)
            .cornerRadius(14)
            .padding(.trailing, 12)
            .padding(.leading, 32)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
