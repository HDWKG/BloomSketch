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
    
    // Run through the simulator for best performance~
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(SwiftDataContainer.container)
        }
        .modelContainer(for: [Tree.self, Drawing.self])
        
        #if os(watchOS)
        WKNotificationScene(Controller: NotificationController.self, category: "StreakEnding")
        #endif
    }
}
