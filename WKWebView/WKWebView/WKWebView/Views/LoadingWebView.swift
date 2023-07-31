//
//  LoadingWebView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct LoadingWebView: View {
    
    @State private var isLoading: Bool = true
    @State private var error: Error?
    let url: URL?
    
    var body: some View {
        ZStack {
            if let error = error {
                Text(error.localizedDescription)
                    .foregroundColor(.purple)
            } else if let url = url {
                PlatformIndependentWebView(url: url, isLoading: $isLoading, error: $error)
                
                if isLoading {
                    ProgressView()
                        .scaleEffect(2)
                }
            } else {
                Text("Sorry! We could not load this url")
                    .foregroundColor(.red)
            }
        }
    }
}

struct LoadingWebView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingWebView(url: URL(string: "https://www.swiftyplace.com"))
    }
}
