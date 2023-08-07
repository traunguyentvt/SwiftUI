//
//  Recording.swift
//  SpringAnimations
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct Recording: View {
    
    @State var recording = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: recording ? 4 : 0)
                .animation(.spring(), value: recording)
                .frame(width: 240, height: 240)
                .foregroundColor(Color(.systemGray6))
                .scaleEffect(recording ? 1 : 0.5)
                .animation(.interactiveSpring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25).repeatForever(autoreverses: false), value: recording)
            
            Circle()
                .frame(width: 160, height: 160)
                .foregroundColor(Color(.systemGray))
                .scaleEffect(recording ? 1 : 0.5)
                .opacity(recording ? 0.6 : 0)
            
            Circle()
                .frame(width: 80, height: 80)
                .scaleEffect(recording ? 0.8 : 1)
                .foregroundColor(.red)
                .overlay(Image(systemName: "mic.fill").font(.largeTitle))
        }
        .onAppear {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: true)) {
                    recording.toggle()
            }
        }
    }
}

struct Recording_Previews: PreviewProvider {
    static var previews: some View {
        Recording()
    }
}
