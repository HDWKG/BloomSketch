//
//  BoardingScreen_3.swift
//  BloomSketch
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct BoardingScreen3: View {
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
                        .offset(y: -60)
                    
                    GeometryReader { geometry in
                        
                        Text("Draw everyday to get daily streaks!")
                            .font(.system(size: geometry.size.width * 0.05, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.top, geometry.size.height * -0.02)
                            .offset(x: geometry.size.width * 0.1, y: geometry.size.height * -0.5)
                        
                        VStack {
                            Image("boarding_3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                                .padding(.top, geometry.size.height * 0.2)
                                .padding(.horizontal, geometry.size.height * 0.02)
                                .offset(x: geometry.size.width * 0.2, y: geometry.size.height * -0.2)
                            
                            Spacer()
                            
                            Button(action: { success = true }) {
                                Text("Continue")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, geometry.size.height * 0.04)
                                    .padding(.horizontal, geometry.size.width * 0.2)
                                    .background(Color(hex: 0x1B3F2E))
                                    .cornerRadius(16)
                                    .padding(.top, geometry.size.height * -0.05)
                                    .offset(x: geometry.size.width * 0.2)
                            }
                            
                            Spacer()
                        }
                    }
                    .font(.system(size: 20)) // Set the default font size here
                    
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
    return BoardingScreen3(success: $success)
}
