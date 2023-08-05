//
//  CardBottomView.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Mithun has achieved UI Design course with approval from a Design+Code instructor.")
                .lineLimit(nil)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: mainSize.size.height - 215)
    }
}

struct CardBottomView_Previews: PreviewProvider {
    static var previews: some View {
        CardBottomView()
    }
}
