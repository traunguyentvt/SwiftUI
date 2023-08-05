//
//  MenuButton.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct MenuButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                show.toggle()
            }) {
                HStack {
                    Spacer()
                    
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 18)
                .frame(width: 90, height: 60)
                .background(Color("button"))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
            }
            
            Spacer()
        }
    }
}

struct MenuButton_Preview: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        MenuButton(show: $show)
    }
}
