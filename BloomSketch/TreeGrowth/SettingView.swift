//
//  Settings.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import SwiftData

struct SettingView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    @State private var navigateToSplashScreen = false
    @State private var navigateToTreeHome = false
    
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
            
            NavigationStack {
                List {
                    HStack {
                        Text("Enable Timer")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        Spacer()
                        Toggle("", isOn: enableTimerBinding)
                    }
                    .fixedSize()
                    
                    Button(action: {
                        tree.name = "Default"
                        navigateToSplashScreen = true
                    }) {
                        Text("Admin: Reset Name + Show Boarding!")
                    }
                    .foregroundColor(.green)
                    
                    Button(action: {
                        tree.dailyDone = false
                        navigateToTreeHome = true
                    }) {
                        Text("Admin: Reset Daily!")
                    }
                    .foregroundColor(.green)
                }
                
                NavigationLink(destination: SplashScreen()
                    .modelContainer(SwiftDataContainer.container), isActive:
                                $navigateToSplashScreen) {
                    EmptyView()
                }
                
                NavigationLink(destination: ContentView(), isActive: $navigateToTreeHome) {
                    EmptyView()
                }
            }
            
        }
    }
}


#Preview {
    SettingView()
        .modelContainer(SwiftDataContainer.container)
}
