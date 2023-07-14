//
//  SectionHeaderView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI


struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
//            .padding(.vertical, 10)
//            .padding(.leading)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.white.edgesIgnoringSafeArea(.top).shadow(radius: 5))
    }
}


struct SectionHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "VT")
    }
}
