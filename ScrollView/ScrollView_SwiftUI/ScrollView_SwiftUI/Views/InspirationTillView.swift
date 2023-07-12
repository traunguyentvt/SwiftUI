//
//  InspirationTillView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/12/23.
//

import SwiftUI

struct InspirationTillView: View {
    let inspiration: Inspiration
    let size: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        Image(inspiration.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(radius: 5)
    }
}

struct InspirationTillView_Preview: PreviewProvider {
    static var previews: some View {
        InspirationTillView(inspiration: Inspiration.createInspirations()[0], size: 300, cornerRadius: 15)
        InspirationTillView(inspiration: Inspiration.createInspirations()[1], size: 300, cornerRadius: 15)
    }
}
