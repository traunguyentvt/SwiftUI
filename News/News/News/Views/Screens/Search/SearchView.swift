//
//  SearchView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel: SearchViewModel
    
    init(service: Serviceable) {
        self._viewModel = ObservedObject(wrappedValue: SearchViewModel(service: service))
    }
    
    var body: some View {
        baseView()
            .searchable(text: $viewModel.searchQuery, placement: .toolbar, prompt: "Search News")
            .onSubmit(of: .search) {
                viewModel.checkValidation()
            }
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.state {
        case .ready:
            CustomStateView(image: "magnifyingglass", description: "Search Something", tinColor: .gray)
            
        case .loading:
            ProgressView("Loading")
            
        case .empty:
            CustomStateView(image: "newspaper", description: "There is no data!", tinColor: .indigo)
            
        case .finished:
            NewsListView(news: viewModel.news)
                .showTabbar()
            
        case .error(error: let error):
            CustomStateView(image: "exclamationmark.transmission", description: "Something get wrong!", tinColor: .red)
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Error Message"), message: Text(error), dismissButton: Alert.Button.default(Text("OK"), action: {
                        viewModel.changeStateToEmpty()
                    }))
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(service: APIService())
    }
}
