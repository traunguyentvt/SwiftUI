//
//  Emoji.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/25/23.
//

import Foundation

struct Emoji: Identifiable, Hashable {
    let id = UUID()
    let content: String
    
    static func emojiExamples() -> [Emoji] {
        let emojis = ["🤓", "🥶", "🅱️", "🖐", "😸", "🎃", "🤩"]
        return emojis.map { Emoji(content: $0) }
    }
}
