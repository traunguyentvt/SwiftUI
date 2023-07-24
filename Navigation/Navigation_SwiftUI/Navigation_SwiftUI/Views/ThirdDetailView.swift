//
//  ThirdDetailView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct ThirdDetailView: View {
    
    //SwiftUI uses @Binding to tell the system that a property has read/write access to a value without ownership. Creating a binding occurs by passing in a state property with the $ prefix. We use $ to pass the binding reference, because without $ Swift will pass a copy of a value instead of passing bindable reference.
    @Binding var nav: (selection: Int, firstDetailIsShown: Bool, secondDetailIsShown: Bool)
    
    var body: some View {
        VStack {
            Text("Third Detail View")
            NavigationLink(destination: ThirdDetailView2(nav: $nav), isActive: $nav.secondDetailIsShown) {
                Text("Goto next detail")
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "") {
            nav.firstDetailIsShown = false
        })
    }
}

