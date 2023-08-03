//
//  RightMenuView.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI

struct RightMenuView: View {
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text("Hello TVT")
                    .foregroundColor(.red)
                
                Button {
                    withAnimation {
                        sideMenuCenterView.wrappedValue = AnyView(PhotosView())
                        sideMenuRightPanel.wrappedValue = false
                    }
                } label: {
                    Text("YE-VT")
                        .foregroundColor(.yellow)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .foregroundColor(.cyan)
            .background(.green)
            .background(Rectangle().shadow(radius: 4))
        }
    }
}

struct RightMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RightMenuView()
    }
}
