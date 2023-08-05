//
//  MenuRow.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct MenuRow: View {
    
    var menu: Menu
    
    var body: some View {
        HStack {
            Image(systemName: menu.icon)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(menu.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(menu: Menu.MenuData()[0])
    }
}
