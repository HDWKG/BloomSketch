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
    @State private var isCheckBoxSelected = false
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                if let tree = trees.first {
                    if tree.name != "Default" {
                        ContentView()
                    } else {
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x63B256), Color(.white)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .ignoresSafeArea(.all)
                            
                            if UIDevice.current.userInterfaceIdiom == .phone {
                                
                                VStack {
                                    Image("BloomSketch_LogoWhite")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 240, height: 240)
                                        .foregroundColor(.red)
                                        .offset(y: 50)
                                    
                                    Spacer()
                                    
                                    Text("The app requires phone access to enable features")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                        .padding(.horizontal, 32)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        HStack {
                                            Image(systemName: "photo")
                                                .resizable(resizingMode: .tile)
                                                .scaledToFit()
                                                .frame(width: 48, height: 48)
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                                .offset(x: 0, y: 0)
                                                .padding(.leading, 8)
                                                                                        
                                            Text("Image saving access to Photos")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.horizontal, 8)
                                        }
                                        .padding(.horizontal, 24)
                                        .padding(.bottom, 16)
                                    }
                                    .cornerRadius(16)
                                    .padding(.horizontal, 16)
                                    
                                    VStack {
                                        Button(action: {
                                            isCheckBoxSelected.toggle()
                                        }) {
                                            HStack {
                                               
                                                Text("Check to continue")
                                                    .font(.system(size: 20, weight: .regular))
                                                    .foregroundColor(Color(hex: 0x1B3F2E))
                                                
                                                Image(systemName: isCheckBoxSelected ? "checkmark.square" : "square")
                                                    .resizable()
                                                    .frame(width: 24, height: 24)
                                                    .foregroundColor(isCheckBoxSelected ? Color(hex: 0x1B3F2E) : .gray)
                                            }
                                        }
                                        .padding(.horizontal, 48)
                                        .padding(.top, 20)
                                        
                                        Button(action: {
                                            navigateToOpeningView = true
                                        }) {
                                            Text("Continue")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.vertical, 12)
                                                .padding(.horizontal, 64)
                                                .background(isCheckBoxSelected ? Color(hex: 0x1B3F2E) : Color.gray)
                                                .cornerRadius(16)
                                        }
                                        .padding(.top, 30)
                                        .padding(.bottom, 100)
                                        .disabled(!isCheckBoxSelected)
                                        
                                        NavigationLink(destination: OpeningView(), isActive: $navigateToOpeningView) {
                                            EmptyView()
                                        }
                                    }
                                }
                            } else if UIDevice.current.userInterfaceIdiom == .pad {
                                VStack {
                                    Image("BloomSketch_LogoWhite")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                                        .foregroundColor(.red)
                                        .offset(y: geometry.size.height * 0.01)
                                       
                                    Spacer()
                                   
                                    Text("The app requires phone access to enable features")
                                        .font(.system(size: geometry.size.width * 0.05, weight: .bold))
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                        .padding(.horizontal, geometry.size.width * 0.1)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.center)
                                       
                                    Spacer()
                                    
                                    VStack(spacing: 20) {
                                        HStack {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                                .padding(.leading, geometry.size.width * 0.02)
                                            
                                            Spacer()
                                            
                                            Text("Image saving access to Photos")
                                                .font(.system(size: geometry.size.width * 0.040, weight: .bold))
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.horizontal, geometry.size.width * 0.02)
                                                .offset(x: -geometry.size.width * 0.08)
                                        }
                                        .padding(.horizontal, geometry.size.width * 0.05)
                                        .padding(.bottom, geometry.size.height * 0.02)
                                    }
                                    .cornerRadius(16)
                                    .padding(.horizontal, geometry.size.width * 0.04)
                                    
                                    VStack {
                                        Button(action: {
                                            isCheckBoxSelected.toggle()
                                        }) {
                                            HStack {
                                                Text("Check to continue")
                                                    .font(.system(size: geometry.size.width * 0.040, weight: .regular))
                                                    .foregroundColor(Color(hex: 0x1B3F2E))
                                                
                                                Image(systemName: isCheckBoxSelected ? "checkmark.square" : "square")
                                                    .resizable()
                                                    .frame(width: 48, height: 48)
                                                    .foregroundColor(isCheckBoxSelected ? Color(hex: 0x1B3F2E) : .gray)
                                            }
                                        }
                                        .padding(.horizontal, geometry.size.width * 0.1)
                                        .padding(.top, geometry.size.height * 0.03)
                                       
                                        Button(action: {
                                            navigateToOpeningView = true
                                        }) {
                                            Text("Continue")
                                                .font(.system(size: 36))
                                                .foregroundColor(.white)
                                                .padding(.vertical, geometry.size.height * 0.02)
                                                .padding(.horizontal, geometry.size.width * 0.15)
                                                .background(isCheckBoxSelected ? Color(hex: 0x1B3F2E) : Color.gray)
                                                .cornerRadius(24)
                                        }
                                        .padding(.top, geometry.size.height * 0.05)
                                        .padding(.bottom, geometry.size.height * 0.15)
                                        .disabled(!isCheckBoxSelected)
                                        
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
    }
}

#Preview {
    PreAlertView()
        .modelContainer(SwiftDataContainer.container)
}
