//
//  ViewState.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation

enum ViewState<T> {
    case loading
    case completedWithNoData
    case completed(response: T)
    case failed(error: String)
}
