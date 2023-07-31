//
//  PlatformIndependentWebView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI
import WebKit

struct PlatformIndependentWebView {
    
    var url: URL
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
    func makeCoordinator() -> PlatformIndependentWebView.Coordinator {
        Coordinator(self)
    }
    
    func makeWebView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        return webView
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: PlatformIndependentWebView
        
        init(_ uiVewView: PlatformIndependentWebView) {
            parent = uiVewView
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation) {
            
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
            parent.isLoading = false
        }
        
        func webView(_webView: WKWebView, didFail navigation: WKNavigation, withError error: Error) {
            parent.isLoading = false
            parent.error = error
        }
    }
}

extension PlatformIndependentWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        makeWebView(context: context)
    }
   
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct PlatformIndependentWebView_Previews: PreviewProvider {
    static var previews: some View {
        PlatformIndependentWebView(url: URL(string: "https://www.swiftyplace.com")!, isLoading: .constant(false), error: .constant(nil))
    }
}
