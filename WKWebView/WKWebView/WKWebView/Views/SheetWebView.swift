//
//  SheetWebView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct SheetWebView: View {
    
    @State private var isSheetPresented = false
    @State private var isLoading = true
    let url: URL? = URL(string: "https://www.swiftyplace.com")
    
    var body: some View {
        Button {
            isSheetPresented = true
        } label: {
            Text("Open web page")
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack {
//                LoadingWebView(url: url)
                Link("JV", destination: url!)
            }
        }
    }
}

struct SheetWebView_Previews: PreviewProvider {
    static var previews: some View {
        SheetWebView()
    }
}
