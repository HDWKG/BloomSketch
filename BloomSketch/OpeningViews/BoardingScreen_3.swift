//
//  BoardingScreen_3.swift
//  BloomSketch
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct BoardingScreen_3: View {
    @State private var sproutName = ""
    var onComplete: () -> Void
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color(hex: 0xD5E4DD)
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("TopBarLeaves")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                            .edgesIgnoringSafeArea(.top)
                        
                        Text("Draw Everyday to Get Daily Streaks!")
                            .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Image("boarding_3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.6)
                            .foregroundColor(.red)
                            .padding(.top, geometry.size.height * 0.02)
                            .offset(y: geometry.size.height * 0.05)
                        
                        Spacer()
                        
                        Button(action: { onComplete() }) {
                            Text("Start")
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
    BoardingScreen_3 {
        print("Complete button tapped")
    }
}
