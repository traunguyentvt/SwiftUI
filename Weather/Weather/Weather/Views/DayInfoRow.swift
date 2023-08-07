//
//  DayInfoRow.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct DayInfoRow: View {
    
    var model: DayRowModel
    
    init(model: DayRowModel) {
        self.model = model
    }
    
    var body: some View {
        Group {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(model.day)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(model.date)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(EdgeInsets(top: 24, leading: 28, bottom: 24, trailing: 0))
                
                Spacer()
                
                Text(model.degree)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding(.trailing, -6)
                
                Text("°")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding(.trailing, 2)
                    .padding(.top, -10)
                
                Image(systemName: model.weather.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 50, alignment: .center)
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.bottomColor, .clear]), startPoint: .top, endPoint: .bottom).opacity(0.1))
        .background(Color.clear)
    }
}

struct DayInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        DayInfoRow(model: DayRowModel.DayRowModelData()[0])
    }
}
