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
            ZStack {
                Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Image("top_fluid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                    
                    Text("Unleash Your Creativity and See Your Plant Grow!")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                        .padding(.horizontal, 36)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Image("boarding_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                        .padding(.top, 12)
                        .offset(y: 110)
                    
                    
                    Button(action: onNext) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 64)
                            .background(Color(hex: 0x1B3F2E))
                            .cornerRadius(16)
                            .padding(.top, 130)
                    }
                    
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .offset(y: 34)
                }
            }
        }
    }
}



