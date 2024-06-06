//
//  SoftContentView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI
import AVFoundation

struct OpeningView: View {
    @State private var currentIndex = 0
    @State private var navigateToNewSprout = false
    @State private var player: AVAudioPlayer? // Audio player state variable
    
    var body: some View {
        NavigationStack {
            
            // if condition to restrict OpeningPager :)
            if navigateToNewSprout {
                NewSprout_View()
                    .modelContainer(SwiftDataContainer.container)
            } else {
                OpeningPager(pageCount: 3, currentIndex: $currentIndex) {
                    BoardingScreen_1 {
                        currentIndex += 1
                    }
                    BoardingScreen_2 {
                        currentIndex += 1
                    }
                    BoardingScreen_3 {
                        navigateToNewSprout = true
                    }
                }
            }
        }
        .onAppear {
            guard let url = Bundle.main.url(forResource: "Background_Music", withExtension: "mp3") else { return }
            do {
                try player = AVAudioPlayer(contentsOf: url)
                player?.volume = 0.5
                player?.numberOfLoops = -1 // infinite loop music!
                try player?.prepareToPlay()
                player?.play()
            } catch {
                print("Error playing audio:", error.localizedDescription)
            }
        }
        .onDisappear { // Stop audio on disappear
            player?.stop()
        }
    }
}

#Preview {
    OpeningView()
}


