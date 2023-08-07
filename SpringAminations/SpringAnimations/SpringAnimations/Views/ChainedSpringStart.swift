//
//  ChainedSpringStart.swift
//  SpringAnimations
//
//  Created by VT on 8/7/23.
//

import SwiftUI

struct ChainedSpringStart: View {
    
    @State var moving = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 20, height: 20)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true), value: moving)
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 50, height: 50)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150: -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.05), value: moving)
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 80, height: 80)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150: -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.1), value: moving)
        }
        .onAppear {
            moving.toggle()
        }
    }
}

struct ChainedSpringStart_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpringStart()
    }
}
