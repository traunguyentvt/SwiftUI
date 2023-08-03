//
//  LeftMenuView.swift
//  SlideMenu
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct LeftMenuView: View {
    @Environment(\.sideMenuGestureModeKey) var sideMenuGestureMode
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView
    
    var body: some View {
        let text: String
        if sideMenuGestureMode.wrappedValue == .inactive {
            text = "Enable panel gesture"
        } else {
            text = "Disable panel gesture"
        }
        
        return GeometryReader { geometry in
            VStack(spacing: 10) {
                Text("Hello VT")
                    .foregroundColor(.orange)
                
                Button {
                    withAnimation {
                        sideMenuCenterView.wrappedValue = AnyView(PhotosView())
                        sideMenuLeftPanel.wrappedValue = false
                    }
                } label: {
                    Text("JV")
                }
                
                Button {
                    withAnimation {
                        if sideMenuGestureMode.wrappedValue == .inactive {
                            sideMenuGestureMode.wrappedValue = .active
                        } else {
                            sideMenuGestureMode.wrappedValue = .inactive
                        }
                    }
                } label: {
                    Text(text)
                        .foregroundColor(.white)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .foregroundColor(.black)
            .background(.blue)
            .background(Rectangle().shadow(radius: 4))
        }
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}
