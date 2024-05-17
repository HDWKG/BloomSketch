//
//  CustomNavigationLink.swift
//  BloomSketch
//
//  Created by student on 17/05/24.
//

import SwiftUI
import PencilKit

struct CustomNavigationLink: View {
    @Binding var canvas: PKCanvasView
    @Binding var isDraw: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    @Binding var action: Int?
    
    var body: some View {
        NavigationLink(
            destination: DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                .navigationTitle("Drawing")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing: HStack(spacing: 1) {
                        ColorPicker("", selection: $color)
                            .padding()
                        
                        Button(action: {
                            isDraw = false
                        }) {
                            Image(systemName: "pencil.slash")
                                .font(.title)
                        }
                        
                        Menu {
                            Button(action: {
                                isDraw = true
                                type = .pencil
                            }) {
                                Label {
                                    Text("Pencil")
                                } icon: {
                                    Image(systemName: "pencil")
                                }
                            }
                            Button(action: {
                                isDraw = true
                                type = .pen
                            }) {
                                Label {
                                    Text("Pen")
                                } icon: {
                                    Image(systemName: "pencil.tip")
                                }
                            }
                            Button(action: {
                                isDraw = true
                                type = .marker
                            }) {
                                Label {
                                    Text("Marker")
                                } icon: {
                                    Image(systemName: "highlighter")
                                }
                            }
                            
                            Button(action: {
                                SaveImage()
                            }) {
                                Label {
                                    Text("Save to Photos")
                                } icon: {
                                    Image(systemName: "highlighter")
                                }
                            }
                        } label: {
                            Image("menu")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                    }
                ),
            tag: 1,
            selection: $action,
            label: {
                EmptyView()
            }
        )
        .hidden()
    }
    func SaveImage() {
        //get image from canvas
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        //save to photos/albums
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

