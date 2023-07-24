//
//  CardGroupBoxStyle.swift
//  Foods_SwiftUI
//
//  Created by VT on 7/22/23.
//

import SwiftUI


struct CardGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            configuration.label
                .font(.title2)
            
            configuration.content

        }
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}

struct CardGroupBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        GroupBox {
            Text("CardGroupBoxStyle")
        }
        .groupBoxStyle(CardGroupBoxStyle())
       
    }
}
