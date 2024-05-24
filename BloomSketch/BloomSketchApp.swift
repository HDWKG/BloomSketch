//
//  BloomSketchApp.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

@main
struct BloomSketchApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        
        #if os(watchOS)
        WKNotificationScene(Controller: NotificationController.self, category: "StreakEnding")
        #endif
    }
}
