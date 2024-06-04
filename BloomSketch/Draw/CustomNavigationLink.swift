//
//  CustomNavigationLink.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//

import SwiftUI
import PencilKit
import Photos

struct CustomNavigationLink: View {
    @StateObject private var viewModel = DrawingViewModel()
    @Environment(\.undoManager) private var undoManager
    
    var body: some View {
        NavigationStack {
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
                        
                        Button(action: viewModel.saveDrawing) {
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
