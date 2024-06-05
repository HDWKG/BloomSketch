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
            GeometryReader { geometry in
                ZStack {
                    Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("TopBarLeaves")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                            .edgesIgnoringSafeArea(.top)
                        
                        Spacer()
                        
                        Image("BloomSketch_LogoWhite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            .foregroundColor(.red)
                        
                        Spacer()
                        
                        VStack(spacing: geometry.size.height * 0.02) {
                            Text("Name Your New Sprout")
                                .font(.system(size: geometry.size.width * 0.05, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .frame(height: geometry.size.height * 0.07)
                                
                                TextField("CutiePatotie", text: $sproutName)
                                    .padding(.horizontal)
                            }
                            .frame(width: geometry.size.width * 0.75)
                            .padding(.top, geometry.size.height * 0.02)
                            
                            NavigationLink(destination: ContentView(), isActive: $navigateToTreeHome) {
                                EmptyView()
                            }
                            
                            Button(action: {
                                saveSproutName()
                            }) {
                                Text("Start")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, geometry.size.height * 0.02)
                                    .padding(.horizontal, geometry.size.width * 0.15)
                                    .background(Color(hex: 0x1B3F2E))
                                    .cornerRadius(16)
                            }
                            .padding(.top, geometry.size.height * 0.02)
                        }
                        
                        Spacer()
                        
                        Image("BottomBarLeaves")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
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
