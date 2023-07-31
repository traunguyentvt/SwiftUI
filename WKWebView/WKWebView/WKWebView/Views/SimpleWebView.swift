//
//  SimpleWebView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    
    let url: URL? = URL(string: "https://www.swiftyplace.com")
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url!))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct SimpleWebView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleWebView()
    }
}
