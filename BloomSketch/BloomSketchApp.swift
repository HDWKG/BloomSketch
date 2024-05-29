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
            SplashScreenView()
        }.modelContainer(for: [Tree.self, Drawing.self])
    }
}
