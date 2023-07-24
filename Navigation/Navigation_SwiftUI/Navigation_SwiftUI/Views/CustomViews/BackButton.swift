//
//  BackButton.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct BackButton: View {
    let label: String
    let closure: () -> ()
    
    var body: some View {
        Button(action: { closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                if !label.isEmpty {
                    Text(label)
                }
            }
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(label: "", closure: {
            
        })
    }
}
