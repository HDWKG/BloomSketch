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
    var namedStatus: Bool
    var dailyDone: Bool
    var streak: Int
    var enableTimer: Bool
    
    // Computed property for treePhase based on streak
    var treePhase: String {
        switch streak {
        case 0..<5:
            return "Tree_1"
        case 5..<15:
            return "Tree_2"
        case 15..<30:
            return "Tree_3"
        case 30..<50:
            return "Tree_4"
        default:
            return "Tree_5"
        }
    }
    
    init(name: String, namedStatus: Bool, dailyDone: Bool, streak: Int, enableTimer: Bool) {
        self.name = name
        self.namedStatus = namedStatus
        self.dailyDone = dailyDone
        self.streak = streak
        self.enableTimer = enableTimer
    }
    
    
}
