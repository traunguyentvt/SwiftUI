//
//  FirstMasterView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct FirstMasterView: View {
    
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FirstDetailView(), isActive: self.$nav.tab1Detail1IsShown) {
                    Text("Goto First Detail View")
                }
            }
            .navigationBarTitle(Text("First MasterView"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FirstMasterView_Previews: PreviewProvider {
    static var previews: some View {
        FirstMasterView()
    }
}
