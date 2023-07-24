//
//  FirstDetailView2.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct FirstDetailView2: View {
    
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        VStack {
            Button("Goto Tab 1 root view", action: {
                nav.tab1Detail2IsShown = false
                nav.goToRootController = true
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "") {
            nav.tab1Detail2IsShown = false
        })
    }
}

struct FirstDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView2()
    }
}
