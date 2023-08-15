//
//  HomeViewModel.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation

final class HomeViewModel: BaseViewModel<APIViewState> {
    let service: Serviceable
    var showingAlert: Bool
    
    @Published private(set) var news: [Article]
    
    init(service: Serviceable) {
        self.service = service
        self.news = []
        self.showingAlert = false
    }
    
    func changeStateToEmpty() {
        changeState(.empty)
    }
    
    func fetchNews() {
        changeState(.loading)
        Task { [weak self] in
            guard let self = self else {
                return
            }
            let response = await self.service.fetchAllNews(country: .us)
            switch response {
            case .success(let success):
                self.changeState(.finished)
                guard let articles = success.articles else {
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
