//
//  DiscoverViewModel.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

final class DiscoverViewModel: BaseViewModel<DiscoverViewState> {
    let service: Serviceable
    var defaultCategory: NewsCategory
    var allCategories: [NewsCategory]
    
    init(service: Serviceable) {
        self.service = service
        self.defaultCategory = NewsCategory.general
        self.allCategories = NewsCategory.allCases.filter { $0.title != NewsCategory.general.title }
    }
}

