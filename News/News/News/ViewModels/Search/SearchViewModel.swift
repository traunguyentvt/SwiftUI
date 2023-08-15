//
//  SearchViewModel.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation

final class SearchViewModel: BaseViewModel<APIViewState> {
    let service: Serviceable
    var showingAlert: Bool
    @Published var searchQuery: String
    @Published private(set) var news: [Article]
    
    init(service: Serviceable) {
        self.service = service
        self.showingAlert = false
        self.news = []
        self.searchQuery = ""
    }
    
    func changeStateToEmpty() {
        news = []
        changeState(.empty)
    }
    
    func checkValidation() {
        if searchQuery.isInValid() {
            changeState(.error(error: "Search string is not valid"))
            showingAlert = true
            return
        }
        fetchNews()
    }
    
    func fetchNews() {
        changeState(.loading)
        Task { [weak self] in
            guard let self = self else {
                return
            }
            let response = await self.service.fetchSearchedNews(query: self.searchQuery)
            switch response {
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
}
