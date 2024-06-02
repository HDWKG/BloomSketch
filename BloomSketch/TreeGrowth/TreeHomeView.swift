//
//  TreeHomeView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//
import SwiftUI
import SwiftData
import PencilKit
import UIKit

struct TreeHomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    @State private var navigateToDrawingView = false
    @State private var action: Int? = 0
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color: Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    @State var colorPicker = false
    
    // Responsive
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        if let tree = trees.first {
            NavigationView {
                ZStack {
                    Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("\(tree.name)'s Den")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        ZStack {
                            if tree.dailyDone {
                                Image("LeafOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: self.screenWidth > 600 ? 300 : 160, height: 160)
                                    .foregroundColor(.red)
                            } else {
                                Image("LeafOff")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: self.screenWidth > 600 ? 300 : 160, height: 160)
                                    .foregroundColor(.red)
                            }
                            
                            Text("\(tree.streak)")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                        }
                        
                        Spacer()
                        
                        ZStack {
                            // Chatbox
                            
                            Image(tree.treePhase)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: tree.checkTreePhase(), height: tree.checkTreePhase())
                        }
                        
                        VStack {
                            if tree.dailyDone {
                                VStack {
                                    Button(action: {
                                        navigateToDrawingView = true
                                    }) {
                                        HStack {
                                            Text("Draw Again")
                                                .font(.headline)
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                            
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(Color(hex: 0x1B3F2E))
                                        }
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 72)
                                        .background(Color.white)
                                        .cornerRadius(16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color(hex: 0x1B3F2E), lineWidth: 1)
                                        )
                                    }
                                    .padding(.top, 24)
                                }
                                
                            } else {
                                Button(action: { navigateToDrawingView = true
                                }) {
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
                            
                            NavigationLink(destination: CustomNavigationLink(), isActive: $navigateToDrawingView) {
                                EmptyView()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                    }
                    .padding(.horizontal, 32)
                }
            }
            .navigationBarBackButtonHidden(true) // Hide back button
        }
    }
}


#Preview {
    TreeHomeView()
        .modelContainer(SwiftDataContainer.container)
}
