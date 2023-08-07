//
//  DetailView.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct DetailView: View {
    
    var data: [DetailRowModel] = DetailRowModel.detailRowModelData()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.topColor, .centerColor, .bottomColor]), startPoint: .topLeading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("JV")
                        .font(.system(size: 100))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text("°")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.top, -40)
                        .padding(.leading, -10)
                }
                .padding(.top, 100)
                
                Text("TVT")
                    .font(.system(size: 36))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("YE")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 34) {
                    ForEach(data) { item in
                        TimeWeatherRow(model: item)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("VT", displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
