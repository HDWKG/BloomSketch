//
//  ModelData.swift
//  BloomSketch
//
//  Created by MacBook Pro on 29/05/24.
//

import Foundation
import SwiftData

@MainActor
class SwiftDataContainer {
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Tree.self, configurations: config)
            
            // Seeder
            container.mainContext.insert(Tree(name: "Yebol", dailyDone: true, streak: 34, enableTimer: true))
            
            return container
        } catch {
            fatalError("Failed to create dummy data~")
        }
    }()
}
