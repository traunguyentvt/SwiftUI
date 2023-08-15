//
//  CustomStateView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct CustomStateView: View {
    let image: String
    let description: String
    let tinColor: Color?
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 64, height: 64)
                .aspectRatio(contentMode: .fill)
                .tint(tinColor)
            
            Text(description)
                .modifier(AppViewBuilder(textColor: Color.textColor, textFont: .title3, textAlignment: .center))
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

struct CustomStateView_Previews: PreviewProvider {
    static var previews: some View {
        CustomStateView(image: "exclamationmark.transmission", description: "There is no news!", tinColor: .red)
    }
}
