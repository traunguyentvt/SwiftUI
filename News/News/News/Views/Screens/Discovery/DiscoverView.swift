//
//  DiscoverView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject private var viewModel: DiscoverViewModel
    
    init(service: Serviceable) {
        self._viewModel = ObservedObject(wrappedValue: DiscoverViewModel(service: service))
    }
    
    var body: some View {
        baseView()
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.state {
        case .ready:
            GeometryReader { geo in
                VStack(spacing: 12) {
                    generateGeneralCategory(geo: geo)
                    generateCategories(geo: geo)
                }
                .showTabbar()
            }
        }
    }
    
    @ViewBuilder
    private func generateGeneralCategory(geo: GeometryProxy) -> some View {
        NavigationLink(destination: SelectedDiscoverView(category: viewModel.defaultCategory, service: viewModel.service)) {
            CategoryCell(category: viewModel.defaultCategory)
                .frame(height: geo.size.height/4.0)
                .padding(.horizontal, 12)
        }
    }
    
    @ViewBuilder
    private func generateCategories(geo: GeometryProxy) -> some View {
        StaggeredGrid(list: viewModel.allCategories, columns: 2, showIndicators: false, spacing: 12) { item in
            NavigationLink(destination: SelectedDiscoverView(category: item, service: viewModel.service)) {
                CategoryCell(category: item)
                    .frame(height: geo.size.height/5)
                    .padding(.horizontal, 12)
            }
        }
        .padding(.bottom, 2)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(service: APIService())
    }
}
