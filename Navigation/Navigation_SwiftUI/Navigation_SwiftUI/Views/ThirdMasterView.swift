//
//  ThirdMasterView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct ThirdMasterView: View {
    
    @State var nav = (selection: 2, firstDetailIsShown: false, secondDetailIsShown: false)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are values types. When we put @State before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI.")
                    .lineLimit(3)
                    .padding()
                
                NavigationLink(destination: ThirdDetailView(nav: $nav), isActive: $nav.firstDetailIsShown) {
                    Text("Goto Third Detail View")
                }
            }
            .navigationTitle("Third MasterView")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ThirdMasterView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdMasterView()
    }
}
