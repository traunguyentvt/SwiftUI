//
//  BrowserView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI
import WebKit

struct BrowserView: UIViewRepresentable {
    
    let url: URL
    //The @ObservedObject property wrapper will automatically make sure the property is watched closely so that important changes will reload any views using it. This also means the data must be created elsewhere, then sent in to your view.
    @ObservedObject var viewModel: BrowserViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        viewModel.webView = webView
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
