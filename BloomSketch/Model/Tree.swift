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
    var name: String
    var dailyDone: Bool
    var streak: Int
    var treePhase: String
    var enableTimer: Bool
    
    init(name: String, dailyDone: Bool, streak: Int, enableTimer: Bool) {
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
            treeWidth = 350
        } else if streak < 15 {
            treePhase = "Tree_2"
            treeWidth = 350
        } else if streak < 30 {
            treePhase = "Tree_3"
            treeWidth = 350
        } else if streak < 50 {
            treePhase = "Tree_4"
            treeWidth = 350
        } else {
            treePhase = "Tree_5"
            treeWidth = 350
        }
        
        return treeWidth
    }
    
}
