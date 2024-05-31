//
//  PagerManager.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation
import SwiftUI

struct HomePager<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    @GestureState private var translation: CGFloat = 0
    private let swipeThreshold: CGFloat = 0.1
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Picker(selection: $currentIndex, label: Text("Page Picker")) {
                    ForEach(0..<pageCount, id: \.self) { index in
                        Text("Page \(index + 1)").tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 10)
                
                HStack(spacing: 0) {
                    content.frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(currentIndex) * geometry.size.width)
                .offset(x: translation)
                .animation(.interactiveSpring(), value: translation)
                .gesture(
                    DragGesture()
                        .updating($translation) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            if abs(offset) > swipeThreshold { // Check for minimal swipe
                                let newIndex = (CGFloat(currentIndex) - offset).rounded()
                                self.currentIndex = (Int(newIndex) + pageCount) % pageCount
                            }
                        }
                )
                
            }
        }
    }
}
