//  CustomNavigationLink.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//

import SwiftUI
import PencilKit
import Photos
import SwiftData

struct DrawNavigationLink: View {
    @StateObject private var viewModel = DrawingViewModel()
    @Environment(\.undoManager) private var undoManager
    
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    @State private var timeRemaining = 30
    @State private var timer: Timer?
    @State private var saveEarly: Bool = false
    
    // Responsive
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { geometry in
            
            if let tree = trees.first {
                NavigationStack {
                    ZStack {
                        Color(hex: 0xD5E4DD)
                            .ignoresSafeArea()
                        
                        VStack {
                            Text("Drawing Time")
                                .font(.system(size: geometry.size.width * 0.07, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .padding(.top, geometry.size.height * 0.02)
                            
                            Text("Let's Release Your Creativity!")
                                .font(.system(size: geometry.size.width * 0.05))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                            
                            // Timer display
                            if tree.enableTimer {
                                Text("\(timeRemaining) seconds")
                                    .foregroundColor(.white)
                                    .padding(.vertical, screenHeight * 0.015)
                                    .padding(.horizontal, screenWidth * 0.15)
                                    .background(Color(hex: 0x1B3F2E))
                                    .cornerRadius(16)
                                    .onAppear {
                                        startTimer()
                                    }
                            }
                            
                            DrawingView(canvas: $viewModel.canvas, isDrawing: $viewModel.isDrawing, pencilType: $viewModel.pencilType, color: $viewModel.color)
                                .modelContainer(SwiftDataContainer.container) // ModelContainer include
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar {
                                    ToolbarItemGroup(placement: .bottomBar) {
                                        Button(action: viewModel.clearCanvas) {
                                            Image(systemName: "trash.slash")
                                        }
                                        
                                        Button {
                                            // Undo drawing
                                            undoManager?.undo()
                                        } label: {
                                            Image(systemName: "arrow.uturn.backward")
                                        }
                                        
                                        Button {
                                            // Redo drawing
                                            undoManager?.redo()
                                        } label: {
                                            Image(systemName: "arrow.uturn.forward")
                                        }
                                        
                                        Button(action: { viewModel.isDrawing = false }) {
                                            Image(systemName: "eraser.line.dashed")
                                        }
                                        
                                        Divider()
                                            .rotationEffect(.degrees(90))
                                        
                                        Menu {
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .pencil }) {
                                                Label("Pencil", systemImage: "pencil")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .pen }) {
                                                Label("Pen", systemImage: "applepencil")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .marker }) {
                                                Label("Marker", systemImage: "pencil.tip")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .monoline }) {
                                                Label("Monoline", systemImage: "pencil.line")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .fountainPen }) {
                                                Label("Fountain", systemImage: "paintbrush.pointed.fill")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .watercolor }) {
                                                Label("Watercolor", systemImage: "paintbrush.pointed")
                                            }
                                            
                                            Button(action: { viewModel.isDrawing = true; viewModel.pencilType = .crayon }) {
                                                Label("Crayon", systemImage: "applepencil.and.scribble")
                                            }
                                        } label: {
                                            Image(systemName: "pencil.tip.crop.circle.fill")
                                        }
                                        
                                        Spacer()
                                        
                                        Divider()
                                            .rotationEffect(.degrees(90))
                                        
                                        ColorPicker("", selection: $viewModel.color)
                                        
                                        Button(action: viewModel.toggleRuler) {
                                            Image(systemName: "pencil.and.ruler.fill")
                                        }
                                        
                                        Button(action: {
                                            if tree.enableTimer {
                                                saveEarly = true
                                            } else { // No timer mode save
                                                viewModel.saveDrawing()
                                                if !tree.dailyDone {
                                                    tree.streak += 1
                                                    tree.dailyDone = true
                                                }
                                            }
                                        }) {
                                            VStack {
                                                Image(systemName: "square.and.arrow.down.on.square")
                                                Text("Save")
                                                    .font(.caption2)
                                            }
                                        }
                                        
                                        NavigationLink(destination: ContentView(), isActive: $viewModel.navigateBackToTreeHome) {
                                            EmptyView()
                                        }
                                    }
                                }
                                .alert(isPresented: $viewModel.showAlert) {
                                    Alert(title: Text("Save Drawing"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                                }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true) // Hide back button
            }
        }
    }
    
    // Timer functions
    private func startTimer() {
        timer?.invalidate()
        timeRemaining = 30
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            tick()
        }
    }
    
    private func tick() {
        if let tree = trees.first {
            if timeRemaining > 0 {
                if saveEarly {
                    timer?.invalidate()
                    viewModel.saveDrawing()
                } else {
                    timeRemaining -= 1
                }
            } else {
                if !saveEarly {
                    timer?.invalidate()
                    viewModel.saveDrawing()
                }
            }
            
            if !tree.dailyDone {
                tree.streak += 1
                tree.dailyDone = true
            }
        }
    }
}
