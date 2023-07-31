//
//  ReadingDataEditorView.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct ReadingDataEditorView: View {
    
    enum FocusedField {
        case title, url
    }
    
    @StateObject var readingViewModel: ReadingListViewModel
    @State var urlString: String = ""
    @State var title: String = ""
    
    //SwiftUI gives us a specific property wrapper for tracking which view currently receives user input, called @FocusState. This can be bound to a Boolean to control a single field, or to an enum to control movement between several.
    @FocusState private var focusedField: FocusedField?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create a new reading item")
                .font(.title2)
            
            HStack {
                Text("Title: ")
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .title)
            }
            
            HStack {
                Text("URL: ")
                TextField("New URL", text: $urlString)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .url)
            }
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button {
                    finish()
                } label: {
                    Text("Add")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .padding()
        .onSubmit {
            if focusedField == .title {
                focusedField = .title
            } else {
                finish()
            }
        }
        .onAppear {
            focusedField = .title
        }
    }
    
    private func finish() {
        if let url = URL(string: urlString) {
            readingViewModel.add(url, title: title)
            dismiss()
        }
    }
}

struct ReadingDataEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDataEditorView(readingViewModel: ReadingListViewModel())
    }
}
