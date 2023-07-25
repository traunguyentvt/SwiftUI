//
//  KeyboardView.swift
//  Toolbar_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct KeyboardView: View {
    
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            Text("Keyboard")
            TextField("", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button {
                    input.append("VT ")
                } label: {
                    Text("YE VT")
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
