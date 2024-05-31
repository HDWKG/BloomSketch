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
        ZStack {
            Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                Image("TopBarLeaves")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .edgesIgnoringSafeArea(.top)
                
                Text("Draw Everyday to Get Daily Streaks!")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(hex: 0x1B3F2E))
                    .padding(.horizontal, 32)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                Image("boarding_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
                    .padding(.top, 12)
                    .offset(y: 110)
                
                Button(action: { onComplete() }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 64)
                        .background(Color(hex: 0x1B3F2E))
                        .cornerRadius(16)
                        .padding(.top, 215)
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

#Preview {
    BoardingScreen_3 {}
}
