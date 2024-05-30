//
//  NewSprout_View.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    
    var body: some View {
        PagerManager(pageCount: 2, currentIndex: $currentIndex) {
            TreeHomeView()
                .modelContainer(SwiftDataContainer.container)
            NewSprout_View()
        }
        
    }
}

#Preview {
    ContentView()
}
