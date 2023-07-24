//
//  AudioPlayer.swift
//  ObservedObject_SwiftUI
//
//  Created by VT on 7/23/23.
//

import Foundation
import AVFoundation


class AudioPlayer: ObservableObject {
    private var audioPlayer = AVAudioPlayer()
    @Published var isPlaying: Bool = false
    
    init(name: String, type: String) {
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileUrl)
                audioPlayer.prepareToPlay()
            } catch {
                print("Could not find file \(error.localizedDescription)")
            }
        }
    }
    
    private func play() {
        isPlaying = true
        audioPlayer.play()
    }
    
    private func pause() {
        isPlaying = false
        audioPlayer.pause()
    }
    
    public func togglePlayer() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
}
