//
//  ReadingDetailView.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct ReadingDetailView: View {
    let readingData: ReadingData
    @StateObject var readingViewModel: ReadingListViewModel
    
    @State private var showConfirmationDialog = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LoadingWebView(url: readingData.url)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(readingData.title)
            .toolbar {
                Button(role: .destructive) {
                    showConfirmationDialog.toggle()
                } label: {
                    Label("Delete", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
            .confirmationDialog("Are you sure you want to delete this url?", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    readingViewModel.remove(readingData)
                    dismiss()
                }
            }
    }
}

struct ReadingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDetailView(readingData: ReadingData.createExamples(), readingViewModel: ReadingListViewModel())
    }
}
