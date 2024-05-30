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
    @State private var navigateToDrawingList = false
    @State private var timerToggle = false
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
                VStack {
                    
                    // Segmented Picker
//                    Picker("Select a page", selection: $selectedPage) {
//                        Text("\(tree.name)'s Den").tag(0)
//                        Text("New Sprout View").tag(1)
//                    }
//                    .pickerStyle(.segmented)
//                    .padding(.vertical, 16)
//                    .onChange(of: selectedPage) { value in
//                        navigateToDrawingList = value == 1
//                    }
                    
                    Text("\(tree.name)'s Den")
                    
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
                                    navigateToDrawingList = true
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
                            Button(action: { navigateToDrawingList = true
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
                        
                        Toggle(isOn: $timerToggle) {
                            Text("Enable Timer")
                                .font(.subheadline)
                                .foregroundColor(Color(hex: 0x1B3F2E))
                        }
                        .fixedSize()
                        .padding(.top, 8)
                        
                        NavigationLink(destination: NewSprout_View(), isActive: $navigateToDrawingList) {
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 32)
            }
            .navigationBarBackButtonHidden(true) // Hide back button
        }
    }
}


#Preview {
    TreeHomeView()
        .modelContainer(SwiftDataContainer.container)
}
