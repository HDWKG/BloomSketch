//
//  PagerManager.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation
import SwiftUI

struct OpeningPager<Content: View>: View {
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
                
                HStack(spacing: 12) {
                    ForEach(0..<pageCount, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color(hex: 0x98D13F) : Color.gray)
                            .frame(width: 12, height: 12)
                    }
                }
                .padding(.top, 10)
            }
            .background(Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1)))
        }
    }
}
