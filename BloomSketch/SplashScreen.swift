//
//  SplashScreenView.swift
//  Bloom Sketch
//
//  Created by MacBook Pro on 11/05/24.
//

import SwiftUI

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
                GeometryReader { geometry in
                    VStack {
                        VStack {
                            Image("BloomSketch_LogoWhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                                .foregroundColor(.red)
                            
                            Text("BloomSketch")
                                .font(Font.custom("Baskerville-Bold", size: geometry.size.width * 0.1))
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
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
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
}

#Preview {
    SplashScreenView()
}
