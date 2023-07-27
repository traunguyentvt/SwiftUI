//
//  MonthView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/25/23.
//

import SwiftUI

struct MonthView: View {
    
    let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @Binding var selection: Int
    let month: Int
    
    var body: some View {
        Text(monthNames[month])
            .fixedSize()
            .padding(10)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.40)) {
                    self.selection = month
                }
            }
    }
    
}
