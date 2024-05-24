//
//  TreeHomeView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//
import SwiftUI

struct TreeHomeView: View {
    @State private var dailyDone = true
    @State private var streak = 99
    @State private var treePhase = ""
    @State private var treeWidth: CGFloat = 160
    @State private var action: Int? = 0
    
    // Responsive
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    if dailyDone {
                        Image("LeafOn")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: self.screenWidth > 600 ? 300 : 160, height: 160)
                            .foregroundColor(.red)
                    } else {
                        Image("LeafOff")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .foregroundColor(.red)
                    }
                    
                    Text("\(streak)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                }
                
                Spacer()
                
                ZStack {
                    // Chatbox
                    
                    Image(treePhase)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: treeWidth, height: treeWidth)
                        .onAppear {
                            updateTreePhase()
                        }
                        .onChange(of: streak) { newValue in
                            updateTreePhase()
                        }
                }

                VStack {
                    if dailyDone {
                        VStack {
                            Button(action: {
                                self.action = 1
                            }) {
                                HStack {
                                    Text("Today's Done")
                                        .font(.headline)
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                    
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                }
                                .padding(.vertical, 12)
                                .padding(.horizontal, 40)
                                .background(Color.white)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(hex: 0x1B3F2E), lineWidth: 1)
                                )
                            }
                            .padding(.top, 24)
                            
                            Text("Draw Again")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .underline()
                                .padding(.top, 4)
                            
                        }
                        
                    } else {
                        Button(action: {self.action = 1}) {
                            Text("Start Drawing Today")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 56)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                        }
                        .padding(.top, 24)
                        
                    }
                    
                    CustomNavigationLink(action: $action)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    // MOVE KE CONTROLLER
    private func updateTreePhase() {
        if streak < 5 {
            treePhase = "Tree_1"
            treeWidth = 300
        } else if streak < 15 {
            treePhase = "Tree_2"
            treeWidth = 300
        } else if streak < 30 {
            treePhase = "Tree_3"
            treeWidth = 300
        } else if streak < 50 {
            treePhase = "Tree_4"
            treeWidth = 400
        } else {
            treePhase = "Tree_5"
            treeWidth = 420
        }
    }
    
}



#Preview {
    TreeHomeView()
}
