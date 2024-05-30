//
//  BoardingScreen_1.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct BoardingScreen_1: View {
    @State private var sproutName = ""
    let onNext: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Image("TopBarLeaves")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                    
                    Text("“An app where you can draw and grow your plant Daily.”")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                        .padding(.horizontal, 32)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Image("boarding_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                        .offset(y: 110)
                                 
                    Spacer()
                    
                    ZStack {
                        Button(action: onNext) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                                .padding(.top, 140)
                        }
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

