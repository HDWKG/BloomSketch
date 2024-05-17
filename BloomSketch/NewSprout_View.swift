//
//  NewSprout_View.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct NewSprout_View: View {
    @State private var sproutName = ""
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                Image("TopBarLeaves")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                
                Image("BloomSketch_LogoWhite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 240)
                    .foregroundColor(.red)
                
                Spacer()
                
                VStack(spacing: 2) {
                    Text("Name Your New Sprout")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(height: 56)
                        
                        TextField("CutiePatotie", text: $sproutName)
                            .padding(.horizontal)
                    }
                    .frame(width: 300)
                    .padding(.top, 16)
                    
                    Button(action: createSprout) {
                        Text("Start")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 64)
                            .background(Color(hex: 0x1B3F2E))
                            .cornerRadius(16)
                    }
                    .padding(.top, 24)
                }
                
                Spacer()
                
                Image("BottomBarLeaves")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
            }
        }
    }
    
    func createSprout() {
        // masukin ke controller sendiri kaaah
    }
}


#Preview {
    NewSprout_View()
}
