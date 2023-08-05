//
//  MenuRight.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct MenuRight: View {
    
    @Binding var show: Bool
    @State var showUpdate = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: {
                    show.toggle()
                }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: {
                    showUpdate.toggle()
                }) {
                    CircleButton(icon: "bell")
                        .sheet(isPresented: $showUpdate) {
                            UpdateList()
                        }
                }
            }
            
            Spacer()
        }
    }
}

struct MenuRight_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        MenuRight(show: $show)
    }
}
