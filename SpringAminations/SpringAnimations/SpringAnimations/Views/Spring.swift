//
//  Spring.swift
//  SpringAnimations
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct Spring: View {
    
    @State private var isRotating = false
    @State private var isHidden = false
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 48 : 0), anchor: .leading)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing : .leading)
                .opacity(isHidden ? 0 : 1)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? -48 : 0), anchor: .leading)
        }
        .onTapGesture {
//            withAnimation(.spring()) {
            withAnimation(.interactiveSpring()) {
                isRotating.toggle()
                isHidden.toggle()
            }
        }
    }
}

struct Spring_Previews: PreviewProvider {
    static var previews: some View {
        Spring()
    }
}
