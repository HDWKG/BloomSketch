//
//  NewSprout_View.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI
import SwiftData

struct NewSprout_View: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    @State private var sproutName = ""
    @State private var navigateToTreeHome = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: 0xD5E4DD)
                    .ignoresSafeArea()
                
                VStack {
                    Image("top_fluid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                    
                    Image("BloomSketch_LogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    VStack(spacing: 12) {
                        Text("Name Your New Sprout")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                            .padding(.top, 24)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .frame(height: 48)
                            
                            TextField("CutiePatotie", text: $sproutName)
                                .padding(.horizontal)
                        }
                        .frame(width: 300)
                        .padding(.top, 16)
                        
                        
                        Button(action: {
                            saveSproutName()
                        }) {
                            Text("Plant")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                        }
                        .padding(.top, 16)
                        
                        NavigationLink(destination: ContentView(), isActive: $navigateToTreeHome) {
                            EmptyView()
                        }
                        
                        Spacer()
                        
                    }
                    
                    
                    Image("bottom_fluid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .offset(y: 34)
                }
            }
            .navigationBarBackButtonHidden(true) // Hide back button
        }
    }
    
    
    func saveSproutName() {
        trees.first?.name = sproutName
        navigateToTreeHome = true
    }
}


#Preview {
    NewSprout_View()
}
