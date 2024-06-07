//
//  PreAlertView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI
import SwiftData

struct PreAlertView: View {
    @State private var navigateToOpeningView = false
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    var body: some View {
        NavigationStack {
            if let tree = trees.first {
                if tree.name != "Default" {
                    ContentView()
                } else {
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
                            
                            Text("Allow phone access on the next screen to:")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .padding(.horizontal, 48)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable(resizingMode: .tile)
                                        .scaledToFit()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(.white)
                                        .offset(x: 0, y: 0)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Text("Personalized User Experience")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.horizontal, 8)
                                }
                                .padding(.horizontal, 24)
                                .padding(.top, 16)
                                
                                HStack {
                                    Image(systemName: "photo")
                                        .resizable(resizingMode: .tile)
                                        .scaledToFit()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(.white)
                                        .offset(x: 0, y: 0)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Text("Allow phone access on the next screen to:")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.horizontal, 8)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 16)
                            }
                            .background(Color(hex: 0x1B3F2E))
                            .cornerRadius(16)
                            .padding(.horizontal, 16)
                            
                            Spacer()
                            
                            VStack {
                                Text("Allow phone access on the next screen to:")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(Color(hex: 0x1B3F2E))
                                    .padding(.horizontal, 48)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Button(action: {
                                    navigateToOpeningView = true
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
                                
                                NavigationLink(destination: OpeningView(), isActive: $navigateToOpeningView) {
                                    EmptyView()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PreAlertView()
}
