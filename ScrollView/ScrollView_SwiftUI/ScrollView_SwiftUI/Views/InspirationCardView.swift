//
//  InspirationCardvIEW.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationCardView: View {
    let inspiration: Inspiration
    
    var body: some View {
        Image(inspiration.imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
            .overlay(alignment: .bottomTrailing, content: {
                Text(inspiration.name)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            })
    }
}

struct InspirationCardView_Preview: PreviewProvider {
    static var previews: some View {
        InspirationCardView(inspiration: Inspiration.createInspirations()[0])
            .padding()
        InspirationCardView(inspiration: Inspiration.createInspirations()[1])
            .padding()
    }
}
