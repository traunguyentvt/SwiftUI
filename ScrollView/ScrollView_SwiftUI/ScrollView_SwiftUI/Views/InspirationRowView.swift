//
//  InspirationRowView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationRowView: View {
    let inspiration: Inspiration
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(inspiration.imageName)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.leading, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(inspiration.name)
                Text(inspiration.description).font(.caption)
            }
            
//            .padding(.trailing, 10)
//            .padding(.vertical, 5)
        }
    }
}


struct InspirationRowView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationRowView(inspiration: Inspiration.createInspirations()[0])
        InspirationRowView(inspiration: Inspiration.createInspirations()[1])
    }
}


