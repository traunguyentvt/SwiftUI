//
//  ContentView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    
    //@EnvironmentObject property wrapper lets us create views that rely on shared data, often across an entire SwiftUI app. For example, if you create a user that will be shared across many parts of your app, you should use @EnvironmentObject.
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        TabView(selection: self.$nav.selection) {
            FirstMasterView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            
            SecondMasterView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            
            ThirdMasterView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Third")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavigationModel())
    }
}
