//
//  NewsListView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct NewsListView: View {
    @State var isLoading = false
    let news: [Article]
    
    var body: some View {
        StaggeredGrid(list: news, columns: 2, showIndicators: false, spacing: 12) { item in
            NavigationLink {
                WebView(url: item.url ?? "", showLoading: $isLoading)
                    .overlay(isLoading ? ProgressView("Loading").toAnyView() : EmptyView().toAnyView())
                    .navigationTitle(item.source?.name ?? "")
                    .hideTabbar()
                    .ignoresSafeArea()
            } label: {
                NewsCell(article: MyArticle(imageUrl: item.urlToImage ?? "", owner: item.source?.name ?? "", title: item.title ?? "", date: item.publishedAt?.calculateTime() ?? ""))
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(news: [])
    }
}
