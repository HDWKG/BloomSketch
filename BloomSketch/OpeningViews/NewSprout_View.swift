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
    @State private var showAlert = false
    
    var body: some View {
        if let tree = trees.first {
            NavigationStack {
                GeometryReader { geometry in
                    ZStack {
                        Color(hex: 0xD5E4DD)
                            .ignoresSafeArea()
                        
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            VStack {
                                Image("top_fluid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                                    .edgesIgnoringSafeArea(.top)
                                
                                Image("BloomSketch_LogoFull")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.60)
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                VStack(spacing: geometry.size.height * 0.02) {
                                    Text("Name Your New Sprout")
                                        .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .frame(height: geometry.size.height * 0.07)

                                        TextField("", text: $sproutName)
                                            .padding(.horizontal)
                                            .font(.system(size: geometry.size.width * 0.03, weight: .bold))
                                            .multilineTextAlignment(.center)

                                    }
                                    .frame(width: geometry.size.width * 0.7)
                                    .padding(.top, geometry.size.height * 0.04)
                                    
                                    Button(action: {
                                        if sproutName != "" {
                                            navigateToTreeHome = true
                                            tree.name = sproutName
                                        } else {
                                            // Show alert
                                            showAlert.toggle()
                                        }
                                    }) {
                                        Text("Plant")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.vertical, geometry.size.height * 0.02)
                                            .padding(.horizontal, geometry.size.width * 0.15)
                                            .background(Color(hex: 0x1B3F2E))
                                            .cornerRadius(16)
                                    }
                                    .padding(.top, 16)
                                    .alert(isPresented: $showAlert) {
                                        Alert(
                                            title: Text("Empty Name <3"),
                                            message: Text("Please name your sprout!"),
                                            dismissButton: .default(Text("OK"))
                                        )
                                    }
                                    
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
                            .navigationBarBackButtonHidden(true)
                        } else if UIDevice.current.userInterfaceIdiom == .pad {
                            VStack {
                                Image("top_fluid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                                    .edgesIgnoringSafeArea(.top)
                                
                                Image("BloomSketch_LogoFull")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.4)
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                VStack(spacing: geometry.size.height * 0.00) {
                                    Text("Name Your New Sprout")
                                        .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .frame(height: geometry.size.height * 0.07)

                                        TextField("", text: $sproutName)
                                            .padding(.horizontal)
                                            .font(.system(size: geometry.size.width * 0.03, weight: .bold))
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: geometry.size.width * 0.7)
                                    .padding(.top, geometry.size.height * 0.04)
                                    
                                    Button(action: {
                                        if sproutName != "" {
                                            navigateToTreeHome = true
                                            tree.name = sproutName
                                        } else {
                                            // Show alert
                                            showAlert.toggle()
                                        }
                                    }) {
                                        Text("Plant")
                                            .font(.system(size: 25))
                                            .foregroundColor(.white)
                                            .padding(.vertical, geometry.size.height * 0.02)
                                            .padding(.horizontal, geometry.size.width * 0.15)
                                            .background(Color(hex: 0x1B3F2E))
                                            .cornerRadius(16)
                                    }
                                    .padding(.top, 16)
                                    .alert(isPresented: $showAlert) {
                                        Alert(
                                            title: Text("Empty Name <3"),
                                            message: Text("Please name your sprout!"),
                                            dismissButton: .default(Text("OK"))
                                        )
                                    }
                                    
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
                            .navigationBarBackButtonHidden(true) // Hide back button
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewSprout_View()
        .modelContainer(SwiftDataContainer.container)
}
