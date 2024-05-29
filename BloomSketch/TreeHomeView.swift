//
//  TreeHomeView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//
import SwiftUI
import SwiftData
import PencilKit

struct TreeHomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    @State private var selectedPage = 0
    @State private var navigateToDrawingList = false
    
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
            NavigationView { // Wrap the view in NavigationView
                VStack {
                    // Segmented Picker
                    Picker("Select a page", selection: $selectedPage) {
                        Text("\(tree.name)'s Den").tag(0)
                        Text("Drawing List").tag(1) // Assign tag 1 to Drawing List
                    }
                    .pickerStyle(.segmented)
                    
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
                                .frame(width: 160, height: 160)
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
                            Button(action: { navigateToDrawingList = true }) {
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
                        
                        NavigationLink(destination: TreeHomeView(), isActive: $navigateToDrawingList) {
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 32)
            }
        }
    }
}


#Preview {
    TreeHomeView()
        .modelContainer(SwiftDataContainer.container)
}
