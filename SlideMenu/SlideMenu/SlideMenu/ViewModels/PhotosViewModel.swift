//
//  PhotosViewModel.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI
import Combine

class PhotosViewModel: ObservableObject {
    
    //The PassthroughSubject provides a convenient way to adapt existing imperative code to the combine model
    typealias ViewModelSubject = PassthroughSubject<PhotosViewModel, Never>
    
    @Published var state: ViewState<[PhotoDTO]> = .completedWithNoData
    
    func getPhotos() {
        state = .loading
        
        PhotosFactory.instance.getPhotos() { [weak self] response, error in
            if let error = error {
                self?.state = .failed(error: error)
            } else if let list = response?.data, list.count > 0 {
                self?.state = .completed(response: list)
            } else {
                self?.state = .completedWithNoData
            }
        }
    }
}
