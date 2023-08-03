//
//  ListPhotoRow.swift
//  SlideMenu
//
//  Created by VT on 8/2/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListPhotoRow: View {
    
    let shouldShimmer: Bool
    let photoUrl: String
    
    init(photoUrl: String = "", showShimmer: Bool = false) {
        self.shouldShimmer = showShimmer
        self.photoUrl = photoUrl
    }
    
    var body: some View {
        VStack {
            if shouldShimmer {
                Image("placeHolder")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(height: 250, alignment: .center)
            } else {
                WebImage(url: URL(string:photoUrl), isAnimating: .constant(true))
                .resizable()
                .indicator(.activity)
//                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(height: 250, alignment: .center)
            }
        }
        .cornerRadius(4)
        .frame(maxHeight: 250)
    }
}

//struct ListPhotoRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListPhotoRow()
//    }
//}
