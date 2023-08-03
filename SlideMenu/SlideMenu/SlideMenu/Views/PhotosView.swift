//
//  PhotosView.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI

struct PhotosView: View {
    
    @ObservedObject private var viewModel: PhotosViewModel = PhotosViewModel()
    
    
    init() {
        loadPhotos()
    }
    
    var body: some View {
        containedView()
            .navigationBarTitle("VT")
    }
    
    func containedView() -> AnyView {
        let view: AnyView
        switch viewModel.state {
        case .loading:
            view = AnyView(
                List {
                    ForEach(1..<5) { _ in
                        ListPhotoRow(showShimmer: true)
                    }
                    .listRowSeparator(.hidden)
                }
            )
            break
        case .completedWithNoData:
            view = AnyView(
                Text("No photos shown")
                    .foregroundColor(.blue)
            )
            break
        case .completed(let photos):
            view = AnyView(
                List {
                    ForEach(photos) { photo in
                        ListPhotoRow(photoUrl: photo.urls?.small_s3 ?? "")
                    }
                    .listRowSeparator(.hidden)
                }
            )
            break
        case .failed(let errorMsg):
            view = AnyView(
                Text(errorMsg)
                    .foregroundColor(.red)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
            )
            break
        }
        return view
    }
    
    private func loadPhotos() {
        viewModel.getPhotos()
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
