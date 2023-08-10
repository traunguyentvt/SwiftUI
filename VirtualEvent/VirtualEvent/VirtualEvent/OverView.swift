//
//  OverView.swift
//  VirtualEvent
//
//  Created by VT on 8/7/23.
//

import SwiftUI

struct OverView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            VStack(spacing: 0) {
                TitleView()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                }
                .padding(.top)
                .background(Color.gray.opacity(0.85))
            }
            
            TabBarView()
        }
        .padding()
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
