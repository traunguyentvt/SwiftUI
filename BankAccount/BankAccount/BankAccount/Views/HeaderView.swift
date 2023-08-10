//
//  HeaderView.swift
//  BankAccount
//
//  Created by VT on 8/8/23.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                HStack(spacing: 7) {
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22, alignment: .center)
                    Text("Home")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 41.0/255.0, green: 109.0/255.0, blue: 171.0/255.0))
                }
            }
            
            Spacer()
            
            Text(title)
                .font(.title)
                .foregroundColor(.black)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack(spacing: 7) {
                    Text("Home")
                        .font(.system(size: 20))
                        .hidden()
                    Image("lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                }
            }
        }
        .padding()
        .background(Color.gray)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
