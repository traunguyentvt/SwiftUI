//
//  HomeView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init(service: Serviceable) {
        self._viewModel = ObservedObject(wrappedValue: HomeViewModel(service: service))
    }
    
    var body: some View {
        baseView()
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.state {
        case .finished:
            NewsListView(news: viewModel.news)
                .showTabbar()
            
        case .loading:
            ProgressView("Loading")
            
        case .ready:
            ProgressView()
                .onAppear {
                    viewModel.fetchNews()
                }
            
        case .empty:
            CustomStateView(image: "newspaper", description: "There is no data!", tinColor: .indigo)
            
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(service: APIService())
    }
}
