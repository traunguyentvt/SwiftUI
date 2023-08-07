//
//  TimeWeatherRow.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct TimeWeatherRow: View {
    
    let model: DetailRowModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(model.degree)")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text("°")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.leading, -10)
                    .padding(.top, -24)
            }
            .padding(.bottom, -12)
            
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 54, height: 64, alignment: .center)
                
                Image(systemName: model.weather.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 50, alignment: .center)
                    .foregroundColor(.white)
            }
            
            Text(model.time)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
    }
}

struct TimeWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeWeatherRow(model: DetailRowModel.detailRowModelData()[0])
    }
}
