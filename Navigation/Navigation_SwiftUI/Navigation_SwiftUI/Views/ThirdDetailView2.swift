//
//  ThirdDetailView2.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct ThirdDetailView2: View {
    
    @Binding var nav: (selection: Int, firstDetailIsShown: Bool, secondDetailIsShown: Bool)
    
    var body: some View {
        VStack {
            Text("Third Detail View 2")
            
            Button("Done", action: {
                nav.firstDetailIsShown = false
                nav.secondDetailIsShown = false
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "") {
            nav.secondDetailIsShown = false
        })
    }
}
