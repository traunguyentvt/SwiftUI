//
//  DetailRowModel.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import Foundation

struct DetailRowModel: Identifiable {
    var id = UUID()
    var degree: Int
    var time: String
    var weather: WeatherType
    
    static func detailRowModelData() -> [DetailRowModel] {
        [
            DetailRowModel(degree: 12, time: "09:00", weather: .clouds),
            DetailRowModel(degree: 13, time: "12:00", weather: .rain),
            DetailRowModel(degree: 11, time: "15:00", weather: .clouds),
            DetailRowModel(degree: 12, time: "17:00", weather: .rain)
        ]
    }
}
