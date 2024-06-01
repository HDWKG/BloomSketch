//
//  Drawing.swift
//  BloomSketch
//
//  Created by MacBook Pro on 01/06/24.
//

import Foundation
import SwiftData

@Model
class Drawing {
    var name: String
    var filename: String
    var drawnStatus: Bool
    var difficulty: String

    init(name: String, filename: String, drawnStatus: Bool, difficulty: String) {
        self.name = name
        self.filename = filename
        self.drawnStatus = drawnStatus
        self.difficulty = difficulty
    }
}
