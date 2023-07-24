//
//  EmojiCollectionView.swift
//  ObservedObject_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct EmojiCollectionView: View {
    
    @ObservedObject var messenger: MessengerManager
    @ObservedObject var audioPlayer = AudioPlayer(name: "kickstarter", type: "mp3")
    
    @State var isLarge: Bool = false
    
    var body: some View {
        VStack {
            ForEach(messenger.emojis, id: \.self) { emojiRow in
                HStack {
                    ForEach(emojiRow, id: \.self) { emoji in
                        Text(emoji)
                            .scaleEffect(isLarge ? 1 : 0.5)
                            .frame(maxWidth: 200, maxHeight: 50)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                messenger.add(emoji)
                            }
                    }
                }
            }
            
            Button(action: {
                audioPlayer.togglePlayer()
            }, label: {
                Text(audioPlayer.isPlaying ? "Pause Audio" : "Play Audio")
            })
                .foregroundColor(audioPlayer.isPlaying ? .red : .blue)
                .padding()
        }
        .onAppear {
            audioPlayer.togglePlayer()
            withAnimation(Animation.easeInOut.repeatForever()) {
                isLarge.toggle()
            }
        }
    }
}

struct EmojiCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCollectionView(messenger: MessengerManager())
    }
}
