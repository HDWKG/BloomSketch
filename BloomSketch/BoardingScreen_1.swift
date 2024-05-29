//
//  BoardingScreen_1.swift
//  BloomSketch
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct BoardingScreen1: View {
    @State private var sproutName = ""
    @State private var action: Int? = 0
    @Binding var success: Bool
    
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
                        .overlay(
                    Text("An app where you can draw and grow your plant daily!")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                        .padding(.horizontal, 40)
                        .offset(y: 90)
                    )
                        .offset(y: -60)
                    
                        Image("boarding_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                            .foregroundColor(.red)
                            .padding(.top, 12)
                            .offset(y: 110)
                    Spacer()

                    ZStack {
                        Button(action: { success = true }) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                                .padding(.top, 200)
                        }
                    }
                    Image("BottomBarLeaves")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .offset(y: 33)
                }
            }
        }
    }
}

#Preview {
    @State var success = false
    return BoardingScreen1(success: $success)
}

