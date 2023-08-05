//
//  HomeView.swift
//  DesignCode
//
//  Created by VT on 8/3/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack(alignment: .top) {
            HomeListView(isShown: !show)
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight + 40 : mainSize.height)
            
            HStack {
                MenuButton(show: $show)
                    .offset(x: -40)
                
                Spacer()
                
                MenuRight(show: $showProfile)
                    .offset(x: -16)
            }
            .offset(y: showProfile ? statusBarHeight : 80)
            .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
