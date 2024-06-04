//
//  PreAlertView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct PreAlertView: View {
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: 0xD5E4DD)
                    .ignoresSafeArea()
                
                VStack {
                    Image("BloomSketch_LogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    VStack {
                        Text("Allow phone access on the next screen to:")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, 40)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            Image(systemName: "image")
                                .resizable(resizingMode: .tile)
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                                .offset(x: 0, y: 0)
                        }
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 64)
                            .background(Color(hex: 0x1B3F2E))
                            .cornerRadius(16)
                    }
                    .padding(.top, 16)
                    
                }
            }
        }
    }
}

#Preview {
    PreAlertView()
}
