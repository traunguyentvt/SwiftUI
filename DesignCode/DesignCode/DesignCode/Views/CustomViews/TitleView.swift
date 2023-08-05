//
//  TitleView.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
            Image("Illustration5")
            
            Spacer()
        }.padding()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
