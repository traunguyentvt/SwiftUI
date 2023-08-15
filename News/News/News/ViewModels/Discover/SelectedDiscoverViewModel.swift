//
//  SelectedDiscoverViewModel.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation

final class SelectedDiscoverViewModel: BaseViewModel<APIViewState> {
    private let service: Serviceable
    var showingAlert: Bool
    @Published private(set) var news: [Article]
    private(set) var category: NewsCategory
    
    init(category: NewsCategory, service: Serviceable) {
        self.category = category
        self.service = service
        self.news = []
        self.showingAlert = false
    }
    
    func fetchNews() {
        changeState(.loading)
        Task { [weak self] in
            guard let self = self else {
                return
            }
            let result = await self.service.fetchNewsByCategory(country: .us, category: self.category.title.lowercased())
            switch result {
            case .success(let response):
                self.changeState(.finished)
                guard let articles = response.articles else {
                    return
                }
                DispatchQueue.main.async {
                    self.news = articles
                    if articles.count < 1 {
                        self.changeState(.empty)
                    }
                }
                
            case .failure(let error):
                self.changeState(.error(error: error.customMessage))
                self.showingAlert.toggle()
            }
        }
    }
    
    func changeStateToEmpty() {
        changeState(.empty)
    }
}
