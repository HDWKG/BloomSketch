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
            let container = try ModelContainer(for: Tree.self, Drawing.self, configurations: config)
            
            // Seeder
            container.mainContext.insert(Tree(name: "Yebol", dailyDone: true, streak: 34, enableTimer: true))
            
            for drawing in [
                Drawing(name: "Flower", filename: "drawimage_1", drawnStatus: false, difficulty: "Hard"),
                Drawing(name: "Turtle", filename: "drawimage_2", drawnStatus: true, difficulty: "Easy"),
                Drawing(name: "Kangaroo", filename: "drawimage_3", drawnStatus: false, difficulty: "Hard"),
                Drawing(name: "Lion", filename: "drawimage_4", drawnStatus: true, difficulty: "Hard"),
                Drawing(name: "Apple", filename: "drawimage_5", drawnStatus: false, difficulty: "Easy"),
                Drawing(name: "House", filename: "drawimage_6", drawnStatus: false, difficulty: "Hard"),
                Drawing(name: "Teddy Bear", filename: "drawimage_7", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Leaf", filename: "drawimage_8", drawnStatus: false, difficulty: "Easy"),
                Drawing(name: "Crab", filename: "drawimage_9", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Hand", filename: "drawimage_10", drawnStatus: false, difficulty: "Easy"),
                Drawing(name: "Cat", filename: "drawimage_11", drawnStatus: false, difficulty: "Easy"),
                Drawing(name: "Pineapple", filename: "drawimage_12", drawnStatus: false, difficulty: "Easy"),
                Drawing(name: "Dolphin", filename: "drawimage_13", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Duck", filename: "drawimage_14", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Owl", filename: "drawimage_15", drawnStatus: false, difficulty: "Hard"),
                Drawing(name: "Tree", filename: "drawimage_16", drawnStatus: true, difficulty: "Hard"),
                Drawing(name: "Watermelon", filename: "drawimage_17", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Strawberry", filename: "drawimage_18", drawnStatus: false, difficulty: "Medium"),
                Drawing(name: "Banana", filename: "drawimage_19", drawnStatus: true, difficulty: "Easy"),
                Drawing(name: "Cactus", filename: "drawimage_20", drawnStatus: false, difficulty: "Medium"),
            ] {
                container.mainContext.insert(drawing)
            }
            
            
            return container
        } catch {
            fatalError("Failed to create dummy data~")
        }
    }()
}
