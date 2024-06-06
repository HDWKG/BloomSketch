//
//  Settings.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import SwiftData

struct Settings: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        if let tree = trees.first {
            let enableTimerBinding = Binding<Bool>(
                get: { tree.enableTimer },
                set: { newValue in
                    tree.enableTimer = newValue
                    try? modelContext.save()
                }
            )
            
            VStack {
                Toggle(isOn: enableTimerBinding) {
                    Text("Enable Timer")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: 0x1B3F2E))
                }
                .fixedSize()
                .padding(.top, 8)
                
                Button(action: {
                    tree.namedStatus = false
                }) {
                    Text("Admin : Reset name to show Boarding!")
                        .foregroundColor(.white)
                        .padding(.vertical, screenHeight * 0.015)
                        .padding(.horizontal, screenWidth * 0.15)
                        .background(Color(hex: 0x1B3F2E))
                        .cornerRadius(16)
                }
                .padding(.top, 24)
                
                Button(action: {
                    tree.dailyDone = false
                }) {
                    Text("Admin : Reset daily!")
                        .foregroundColor(.white)
                        .padding(.vertical, screenHeight * 0.015)
                        .padding(.horizontal, screenWidth * 0.15)
                        .background(Color(hex: 0x1B3F2E))
                        .cornerRadius(16)
                }
                .padding(.top, 24)
            }
        }
    }
}

#Preview {
    Settings()
        .modelContainer(SwiftDataContainer.container)
}
