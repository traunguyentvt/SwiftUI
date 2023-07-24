//
//  SecondMasterView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct SecondMasterView: View {
    
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondDetailView(), isActive: self.$nav.tab2Detail1IsShown) {
                    Text("Goto Second Detail View")
                }
            }
            .navigationTitle("Second MasterView")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SecondMasterView_Previews: PreviewProvider {
    static var previews: some View {
        SecondMasterView()
    }
}
