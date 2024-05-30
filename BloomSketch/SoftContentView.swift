//
//  SoftContentView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation
import SwiftUI

struct SoftContentView: View {
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
    SoftContentView()
}
