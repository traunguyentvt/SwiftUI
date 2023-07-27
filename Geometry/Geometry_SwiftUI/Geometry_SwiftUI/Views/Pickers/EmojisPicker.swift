//
//  EmojisPicker.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/25/23.
//

import SwiftUI

struct EmojisPicker: View {
    
    let emojis = Emoji.emojiExamples()
    @State private var selection = [Emoji]()
    
    //@Namespace creates an animation namespace to allow matched geometry effects, which can be shared by other views. This owns its data. @NSApplicationDelegateAdaptor is used to create and register a class as the app delegate.
    @Namespace private var namespace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select emoji")
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack {
                    Text("Your emojis: ")
                    
                    ForEach(selection) { emoji in
                        Text(emoji.content)
                            .foregroundColor(.clear)
                            .matchedGeometryEffect(id: emoji.id, in: namespace, isSource: selection.contains(emoji))
                    }
                }
                .padding()
            })
                .background(Color.white.cornerRadius(20).shadow(radius: 10))
                .padding()
            
            Spacer()
            Divider()
            
            HStack {
                ForEach(emojis) { emoji in
                    Text(emoji.content)
                        .matchedGeometryEffect(id: emoji.id, in: namespace, isSource: !selection.contains(emoji))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tappedEmoji(emoji)
                            }
                        }
                        .padding(4)
                        .background(Text(emoji.content).opacity(0.3))
                }
            }
        }
        .padding()
    }
    
    private func tappedEmoji(_ emoji: Emoji) {
        if !selection.contains(emoji) {
            selection.append(emoji)
        } else if let index = selection.firstIndex(of: emoji) {
            selection.remove(at: index)
        }
    }
}

struct EmojisPicker_Previews: PreviewProvider {
    static var previews: some View {
        EmojisPicker()
    }
}
