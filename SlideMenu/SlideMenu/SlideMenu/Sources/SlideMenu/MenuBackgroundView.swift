//
//  MenuBackgroundView.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI

struct MenuBackgroundView: View {
    @Binding var sideMenuLeftPanel: Bool
    @Binding var sideMenuRightPanel: Bool
    
    let bgColor: Color
    let bgOpacity: Double
    
    var body: some View {
        Rectangle()
            .background(bgColor)
            .opacity(bgOpacity)
            .transition(.opacity)
            .onTapGesture {
                withAnimation {
                    if self.sideMenuLeftPanel {
                        self.sideMenuLeftPanel.toggle()
                    }
                    
                    if self.sideMenuRightPanel {
                        self.sideMenuRightPanel.toggle()
                    }
                }
        }
        .edgesIgnoringSafeArea(Edge.Set.all)
    }
}
