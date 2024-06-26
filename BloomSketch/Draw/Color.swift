//
//  Color.swift
//  BloomSketch
//
//  Created by MacBook Pro on 15/05/24.
//

import SwiftUI

extension Color {
    // this is color, translate to hex
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

