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
        case 0..<3:
            return "Tree_1"
        case 1..<7:
            return "Tree_2"
        case 3..<14:
            return "Tree_3"
        case 10..<21:
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
