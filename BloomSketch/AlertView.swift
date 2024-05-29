//
//  AlertView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct AlertView: View {
    @State private var sproutName = ""
    @State private var action: Int? = 0
    @Binding var success: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                    .ignoresSafeArea()
                Spacer()

                VStack {
                    Image("BloomSketch_LogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                                        
                    VStack(spacing: 2) {
                        Text("Allow phone access on the next screen to:")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, 16)
                            .padding(.bottom,48)
                        
                        HStack(spacing: 10) {
                            Image("BloomSketch_LogoWhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.red)
                            
                            Text("Storage access to store drawings")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 48)
                        
                        Text("You can change this option later in the app settings.")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.horizontal, 24)
                            .padding(.bottom,32)
                        
                    }
                    
                    
                    Button(action: { success = true }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 64)
                            .background(Color(hex: 0x1B3F2E))
                            .cornerRadius(16)
                    }
                    .padding(.top, 24)
                }
                
                
            }
        }
    }
}

#Preview {
    @State var success = false
    return AlertView(success: $success)
}
