//
//  MainView.swift
//  SlideMenu
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        SideMenu(leftMenu: LeftMenuView(), centerView: PhotosView(), rightMenu: RightMenuView())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
