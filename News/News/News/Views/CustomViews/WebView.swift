//
//  WebView.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    @Binding var showLoading: Bool
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator {
            showLoading = true
        } didFinish: {
            showLoading = false
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        if let url = URL(string: url) {
            let webView = WKWebView()
            webView.navigationDelegate = context.coordinator
            let request = URLRequest(url: url)
            webView.load(request)
            
            return webView
        } else {
            return WKWebView()
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
