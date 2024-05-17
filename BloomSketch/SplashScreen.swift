//
//  SplashScreenView.swift
//  Bloom Sketch
//
//  Created by MacBook Pro on 11/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                .ignoresSafeArea()
            
            if isActive {
                NewSprout_View()
            } else {
                VStack {
                    
                    VStack {
                        Image("BloomSketch_LogoWhite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                            .foregroundColor(.red)
                        
                        Text("BloomSketch")
                            .font(Font.custom("Baskerville-Bold", size: 40))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
