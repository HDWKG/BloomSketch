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
                        
                        Text("“An App Where You Can Draw and Grow Your Plant Daily.”")
                            .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Image("boarding_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            .foregroundColor(.red)
                            .offset(y: geometry.size.height * 0.05)
                                     
                        Spacer()
                        
                        ZStack {
                            Button(action: onNext) {
                                Text("Continue")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, geometry.size.height * 0.02)
                                    .padding(.horizontal, geometry.size.width * 0.15)
                                    .background(Color(hex: 0x1B3F2E))
                                    .cornerRadius(16)
                                    .padding(.top, geometry.size.height * 0.1)
                            }
                        }
                        
                        Image("BottomBarLeaves")
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
    BoardingScreen_1 {
        print("Next button tapped")
    }
}
