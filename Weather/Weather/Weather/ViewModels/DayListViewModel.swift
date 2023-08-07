//
//  DayListViewModel.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import Foundation

class DayListViewModel: ObservableObject {
    @Published var data: [DayRowModel]
    
    init() {
        data = DayRowModel.DayRowModelData()
    }
}
