//
//  CategoryCell.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct CategoryCell: View {
    let category: NewsCategory
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text(category.title)
                    .modifier(AppViewBuilder(textColor: .white, textFont: .subheadline, textAlignment: .leading))
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.bottom, 8)
        }
        .background {
            ZStack {
                Rectangle()
                    .fill(Color(.clear))
                
                Image(category.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
            }
            .clipped()
        }
        .cornerRadius(8)
        .shadow(radius: 8)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: NewsCategory.general)
    }
}
