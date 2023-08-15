//
//  SelectedDiscoverView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct SelectedDiscoverView: View {
    
    @StateObject private var viewModel: SelectedDiscoverViewModel
    
    init(category: NewsCategory, service: Serviceable) {
        self._viewModel = StateObject(wrappedValue: SelectedDiscoverViewModel(category: category, service: service))
    }
    
    var body: some View {
        baseView()
            .navigationTitle(viewModel.category.title.capitalized)
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.state {
        case .ready:
            ProgressView()
                .onAppear {
                    viewModel.fetchNews()
                }
            
        case .empty:
            CustomStateView(image: "newspaper", description: "There is no data!", tinColor: .indigo)
            
        case .loading:
            ProgressView("Loading")
            
        case .finished:
            NewsListView(news: viewModel.news)
                .hideTabbar()
            
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

struct SelectedDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedDiscoverView(category: .technology, service: APIService())
    }
}
