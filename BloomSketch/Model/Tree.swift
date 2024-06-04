//
//  Tree.swift
//  BloomSketch
//
//  Created by MacBook Pro on 24/05/24.
//

import Foundation
import SwiftData

@Model
class Tree {
    @Attribute(.unique) var name: String
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
            treeWidth = 300
        } else if streak < 15 {
            treePhase = "Tree_2"
            treeWidth = 300
        } else if streak < 30 {
            treePhase = "Tree_3"
            treeWidth = 300
        } else if streak < 50 {
            treePhase = "Tree_4"
            treeWidth = 400
        } else {
            treePhase = "Tree_5"
            treeWidth = 420
        }
        
        return treeWidth
    }
    
}
