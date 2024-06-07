//
//  SoftContentView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct OpeningView: View {
    @State private var currentIndex = 0
    @State private var navigateToNewSprout = false
    
    var body: some View {
        NavigationStack {
            
            // if condition to restrict OpeningPager :)
            if navigateToNewSprout {
                NewSprout_View()
                    .modelContainer(SwiftDataContainer.container)
            } else {
                OpeningPager(pageCount: 3, currentIndex: $currentIndex) {
                    BoardingScreen_1 {
                        currentIndex += 1
                    }
                    BoardingScreen_2 {
                        currentIndex += 1
                    }
                    BoardingScreen_3 {
                        navigateToNewSprout = true
                    }
                }
            }
        }
        
    }
}

#Preview {
    OpeningView()
}


