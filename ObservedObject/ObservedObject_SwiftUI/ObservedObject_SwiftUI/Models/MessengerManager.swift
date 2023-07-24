//
//  MessengerManager.swift
//  ObservedObject_SwiftUI
//
//  Created by VT on 7/23/23.
//

import Foundation
import Combine

class MessengerManager: ObservableObject {
    @Published var message: String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    let emojis = [["😇", "🙂", "🤬"],["🤯","🥱", "🤔"],["😸", "😿", "🙀"]]
    
    func clear() {
        message = ""
    }
    
    func add(_ text: String) {
        message.append(text)
    }
    
}
