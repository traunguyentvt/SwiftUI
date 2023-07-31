//
//  ReadingListView.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct ReadingListView: View {
    
    @StateObject var readingViewModel = ReadingListViewModel()
    @State var showReadingDataEditor = false
    @State var selectedURL: URL?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(readingViewModel.readingData) { data in
                    NavigationLink(destination: ReadingDetailView(readingData: data, readingViewModel: readingViewModel)) {
                        ReadingDataRow(readingData: data)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Reading List")
            .toolbar {
                Button {
                    showReadingDataEditor.toggle()
                } label: {
                    Label("Add new reading item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showReadingDataEditor) {
                ReadingDataEditorView(readingViewModel: readingViewModel)
            }
        }
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
