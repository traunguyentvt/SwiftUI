//
//  FirstDetailView.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct FirstDetailView: View {
    
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("First Detail View")
                .font(.title)
            
            Text("This is the data you entered in second tab")
                .font(.body)
            
            Text(nav.data).font(.body)
                .padding()
                .border(.black)
            
            NavigationLink(destination: FirstDetailView2(), isActive: $nav.tab1Detail2IsShown) {
                Text("Go to First Detail View 2")
            }
            
            Button("Goto Second Tab", action: {
                nav.tab1Detail1IsShown = false
                nav.tab2Detail1IsShown = false
                nav.selection = 1
            })
        }
        .onReceive(nav.$tab1Detail2IsShown, perform: { (out) in
            print("receive goToRootController: \(nav.goToRootController) with detail \(nav.tab1Detail1IsShown) and detail \(nav.tab1Detail2IsShown)")
            
            if !nav.tab1Detail2IsShown && nav.tab1Detail1IsShown && nav.goToRootController {
                print("collapse stack")
                nav.tab1Detail1IsShown = false
            }
            
            if !nav.tab1Detail2IsShown && !nav.tab1Detail2IsShown && nav.goToRootController {
                nav.goToRootController = false
            }
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "") {
            nav.tab1Detail1IsShown = false
        })
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView()
    }
}
