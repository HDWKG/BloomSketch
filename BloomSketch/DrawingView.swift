//
//  DrawingView.swift
//  BloomSketch
//
//  Created by student on 16/05/24.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    @Binding var isDrawing: Bool
    @Binding var pencilType: PKInkingTool.InkType
    @Binding var color: Color
    
    var ink : PKInkingTool {
        PKInkingTool(pencilType, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDrawing ? ink : eraser
        canvas.alwaysBounceVertical = true
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //update tool when main view update
        
        uiView.tool = isDrawing ? ink : eraser
    }
    
    
    
}

//#Preview {
//    DrawingView()
//}
