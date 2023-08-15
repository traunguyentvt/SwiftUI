//
//  SelectedDiscoverViewState.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

enum APIViewState: ViewStateProtocol, Equatable {
    case ready
    case finished
    case loading
    case empty
    case error(error: String)
}
