//
//  BloomSketchApp.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI
import SwiftData

@main
struct BloomSketchApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(SwiftDataContainer.container)
        }
        .modelContainer(for: [Tree.self])
        
        #if os(watchOS)
        WKNotificationScene(Controller: NotificationController.self, category: "StreakEnding")
        #endif
    }
}
