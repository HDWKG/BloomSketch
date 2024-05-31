//
//  Settings.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI

struct Settings: View {
    @State private var timerToggle = false

    var body: some View {
        Toggle(isOn: $timerToggle) {
            Text("Enable Timer")
                .font(.subheadline)
                .foregroundColor(Color(hex: 0x1B3F2E))
        }
        .fixedSize()
        .padding(.top, 8)
    }
}

#Preview {
    Settings()
}
