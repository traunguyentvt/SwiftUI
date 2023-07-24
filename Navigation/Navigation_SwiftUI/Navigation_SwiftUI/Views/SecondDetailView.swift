//
//  SecondDetailView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct SecondDetailView: View {
    
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Second Detail View")
                .font(.title)
            
            Button("Goto First Tab Detail", action: {
                nav.tab1Detail1IsShown = true
                nav.tab2Detail1IsShown = false
                nav.tab1Detail2IsShown = false
                nav.selection = 0
            })
            
            Button("Goto First Tab Master", action: {
                nav.tab1Detail1IsShown = false
                nav.tab2Detail1IsShown = false
                nav.tab1Detail2IsShown = false
                nav.selection = 0
            })
            
            TextField("Enter text to send to First Tab Master", text: $nav.data)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "") {
            nav.tab2Detail1IsShown = false
        })
    }
}

struct SecondDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailView()
    }
}
