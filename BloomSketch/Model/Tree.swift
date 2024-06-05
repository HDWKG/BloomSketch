//
//  Tree.swift
//  BloomSketch
//
//  Created by MacBook Pro on 24/05/24.
//

import Foundation
import SwiftData

@Model
final class Tree: Identifiable {
    @Attribute(.unique) var id: String = UUID().uuidString
    var name: String
    var dailyDone: Bool
    var streak: Int
    var treePhase: String
    var enableTimer: Bool
    
    init(id: String = UUID().uuidString, name: String, dailyDone: Bool, streak: Int, enableTimer: Bool) {
        self.id = id
        self.name = name
        self.dailyDone = dailyDone
        self.streak = streak
        self.treePhase = ""
        self.enableTimer = enableTimer
    }
    
    func checkTreePhase() -> CGFloat {
        var treeWidth: CGFloat
        
        if streak < 5 {
            treePhase = "Tree_1"
            treeWidth = 400
        } else if streak < 15 {
            treePhase = "Tree_2"
            treeWidth = 400
        } else if streak < 30 {
            treePhase = "Tree_3"
            treeWidth = 400
        } else if streak < 50 {
            treePhase = "Tree_4"
            treeWidth = 500
        } else {
            treePhase = "Tree_5"
            treeWidth = 520
        }
        
        return treeWidth
    }
    
}
