//
//  PhotosFactory.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation

class PhotosFactory: APIFactory {
    static let instance = PhotosFactory()
    
    func getPhotos(completed: @escaping (ResponseBase?, String?) -> Void) {
        API.getPhotos.get(request: PhotoRequest(), domain: Constants.API.baseUrl) { (response: ResponseBase?) in
            if let err = self.checkResponse(response: response) {
                completed(nil, err)
                return
            }
            
            completed(response, nil)
        }
    }
}
