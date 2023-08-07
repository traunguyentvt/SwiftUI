//
//  PositionSpring.swift
//  SpringAnimations
//
//  Created by VT on 8/7/23.
//

import SwiftUI

struct PositionSpring: View {
    
    @State var moving = false
    
    var body: some View {
        VStack {
            Text("VT")
                .font(.title)
                .foregroundColor(.red)
                .fontWeight(.bold)
                .multilineTextAlignment(TextAlignment.center)
            
            Spacer()
            
            Image("ball")
                .offset(y: moving ? 150 : -150)
                .scaleEffect(moving ? 2 : 1)
                .onAppear {
                    withAnimation(.spring().repeatForever(autoreverses: true)) {
                        moving.toggle()
                    }
                }
            
            HStack(spacing: 300) {
                Text("A")
//                Spacer()
                Text("B")
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PositionSpring_Previews: PreviewProvider {
    static var previews: some View {
        PositionSpring()
    }
}
