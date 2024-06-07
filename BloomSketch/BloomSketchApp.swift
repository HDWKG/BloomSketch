//
//  BloomSketchApp.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI
import SwiftData
import AVFoundation

@main
struct BloomSketchApp: App {
    @State private var player: AVAudioPlayer?
    @Environment(\.scenePhase) private var scenePhase 

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(SwiftDataContainer.container)
                .onAppear {
                    startBackgroundMusic()
                }
                .onDisappear {
                    stopBackgroundMusic()
                }
        }
        .modelContainer(for: [Tree.self])
        .onChange(of: scenePhase) { newPhase in
            handleScenePhaseChange(newPhase)
        }
        
        #if os(watchOS)
        WKNotificationScene(Controller: NotificationController.self, category: "StreakEnding")
        #endif
    }

    private func startBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "Background_Music", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.5
            player?.numberOfLoops = -1 // infinite loop music!
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing audio:", error.localizedDescription)
        }
    }

    private func stopBackgroundMusic() {
        player?.stop()
    }

    private func handleScenePhaseChange(_ newPhase: ScenePhase) {
        switch newPhase {
        case .active:
            player?.play()
        case .inactive, .background:
            player?.pause()
        @unknown default:
            break
        }
    }
}
