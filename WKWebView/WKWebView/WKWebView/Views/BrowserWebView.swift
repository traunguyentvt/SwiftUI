//
//  BrowserWebView.swift
//  WKWebView
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct BrowserWebView: View {
    
    //The @StateObject property wrapper is a specialized form of @ObservedObject, having all the same functionality with one important addition: it should be used to create observed objects, rather than just store one that was passed in externally.
    @StateObject var browserViewModel = BrowserViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    browserViewModel.goBack()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .disabled(!browserViewModel.canGoBack)
                
                Button {
                    browserViewModel.goForward()
                } label: {
                    Image(systemName: "chevron.forward")
                }
                .disabled(!browserViewModel.canGoForward)
                .padding(.trailing, 10)
                
                TextField("URL", text: $browserViewModel.urlString, onCommit: {
                    browserViewModel.loadURLString()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    browserViewModel.reload()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .padding(.horizontal)
            
            if let url = URL(string: browserViewModel.urlString) {
                BrowserView(url: url, viewModel: browserViewModel)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Please, enter a url")
                    .foregroundColor(.red)
                    .font(.title)
                    .bold()
            }
        }
    }
}

struct BrowserWebView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserWebView()
    }
}
