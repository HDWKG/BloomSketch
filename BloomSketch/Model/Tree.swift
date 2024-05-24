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
    var dailyDone = true
    var streak = 99
    var treePhase = ""

    init(dailyDone: Bool = true, streak: Int = 99, treePhase: String = "") {
        self.dailyDone = dailyDone
        self.streak = streak
        self.treePhase = treePhase
    }
    
    func updateTreePhase() -> CGFloat {
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
