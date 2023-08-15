//
//  BaseViewModel.swift
//  News
//
//  Created by VT on 8/14/23.
//

import SwiftUI

class BaseViewModel<S: ViewStateProtocol>: ObservableObject {
    @Published var state: S = .ready
    
    func changeState(_ state: S) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
            
            debugPrint("State changed to \(state)")
        }
    }
}
