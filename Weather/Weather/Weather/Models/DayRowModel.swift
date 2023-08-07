//
//  DayRowModel.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import Foundation

enum WeatherType {
    case snow, rain, sun, clouds
    
    var icon: String {
        switch self {
        case .clouds:
            return "cloud"
        case .rain:
            return "cloud.rain"
        case .snow:
            return "cloud.snow"
        case .sun:
            return "sun.min"
        }
    }
}

struct DayRowModel: Identifiable {
    var id = UUID()
    var day: String
    var date: String
    var degree: String
    var weather: WeatherType
    
    static func DayRowModelData() -> [DayRowModel] {
        [
            DayRowModel(day: "Sunday", date: "10 Jun", degree: "19", weather: .sun),
            DayRowModel(day: "Monday", date: "11 Jun", degree: "12", weather: .rain),
            DayRowModel(day: "Wednesday", date: "12 Jun", degree: "15", weather: .sun),
            DayRowModel(day: "Thursday", date: "13 Jun", degree: "-2", weather: .snow),
            DayRowModel(day: "Friday", date: "14 Jun", degree: "-4", weather: .snow)
        ]
    }
}
