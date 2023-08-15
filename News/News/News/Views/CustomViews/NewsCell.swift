//
//  NewsCell.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

struct NewsCell: View {
    let article: MyArticle
    @State var isEmpty: Bool = false
    
    init(article: MyArticle) {
        self.article = article
    }
    
    var body: some View {
        VStack(spacing: 12) {
            loadImage()
            
            HStack {
                VStack(spacing: 12) {
                    showText(text: article.owner, textColor: .gray, font: .footnote, padding: .leading, limitLine: 1)
                        .padding(.top)
                    
                    showText(text: article.title, textColor: Color.textColor, font: .subheadline, padding: .horizontal)
                    
                    showText(text: article.date, textColor: .gray, font: .footnote, padding: .bottom, limitLine: 1)
                        .padding(.leading)
                }
                
                Spacer()
            }
        }
        .background(Color.cellColor)
        .cornerRadius(8)
        .padding(.horizontal)
        .shadow(radius: 5)
    }
    
    @ViewBuilder
    private func showText(text: String, textColor: Color, font: Font, textAlignment: TextAlignment = .leading, padding: Edge.Set = .leading, limitLine: Int? = nil) -> some View {
        HStack {
            Text(text)
                .modifier(AppViewBuilder(textColor: textColor, textFont: font, textAlignment: textAlignment))
                .lineLimit(limitLine)
            
            Spacer()
        }
        .padding(padding)
    }
    
    @ViewBuilder
    private func loadImage() -> some View {
        if let url = URL(string: article.imageUrl) {
            VStack {
                CacheAsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                        
                    case .success(let image):
                        image
                            .resizable()
//                            .aspectRatio(contentMode: .fill)
                        
                    case .failure(_):
                        EmptyView()
                            .task {
                                isEmpty.toggle()
                            }
                        
                    @unknown default:
                        fatalError()
                    }
                }
            }
            .frame(height: isEmpty ? 0 : 100)
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(article: MyArticle(imageUrl: "", owner: "VT", title: "French government rejects union demand to rethink pension bill", date: "2023-03-28T12:20:00Z".calculateTime()))
    }
}
