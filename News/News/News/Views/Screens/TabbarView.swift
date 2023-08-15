//
//  TabbarView.swift
//  News
//
//  Created by VT on 8/13/23.
//

import SwiftUI

struct TabbarView: View {
    
    @State var menuItemType: MenuItemType = .discover
    private let service: Serviceable
    
    init() {
        let attrs = [
            NSAttributedString.Key.foregroundColor: Color.tabbarTextColor ?? .red,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 20)!
        ]
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = attrs
        navBarAppearance.titleTextAttributes = attrs
        
        service = APIService()
    }
    
    var body: some View {
        TabView(selection: $menuItemType) {
            TabItemView(MenuItemType.home) {
                HomeView(service: service)
            }
            TabItemView(MenuItemType.discover) {
                DiscoverView(service: service)
            }
            TabItemView(MenuItemType.search) {
                SearchView(service: service)
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
