//
//  CircleButton.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct CircleButton: View {
    
    var icon = "person.crop.circle"
    
    var body: some View {
        Image(systemName: icon)
            .foregroundColor(.primary)
            .frame(width: 44, height: 44)
            .background(Color("button"))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
