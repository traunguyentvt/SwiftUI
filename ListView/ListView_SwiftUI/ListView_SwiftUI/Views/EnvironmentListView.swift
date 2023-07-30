//
//  EnvironmentListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/27/23.
//

import SwiftUI

struct EnvironmentListView: View {
    var body: some View {
        NavigationView {
            ListStylingView()
                .navigationTitle("JV")
            
//            ListStylingView()
//                .navigationTitle("VT")
        }
    }
}

struct EnvironmentListView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentListView()
    }
}
