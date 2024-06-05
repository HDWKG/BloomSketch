//
//  BoardingScreen_2.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct BoardingScreen_2: View {
    @State private var sproutName = ""
    let onNext: () -> Void

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color(hex: 0xD5E4DD)
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("top_fluid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                            .edgesIgnoringSafeArea(.top)
                        
                        Text("Unleash Your Creativity and See Your Plant Grow!")
                            .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Image("boarding_2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            .foregroundColor(.red)
                            .padding(.top, geometry.size.height * 0.02)
                            .offset(y: geometry.size.height * 0.05)
                        
                        Spacer()
                        
                        Button(action: onNext) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, geometry.size.height * 0.02)
                                .padding(.horizontal, geometry.size.width * 0.15)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                                .padding(.top, geometry.size.height * 0.13)
                        }
                        
                        Spacer()
                        
                        Image("bottom_fluid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            .offset(y: geometry.size.height * 0.1)
                    }
                }
            }
        }
    }
}

#Preview {
    BoardingScreen_2 {
        print("Next button tapped")
    }
}
