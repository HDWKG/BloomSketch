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
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = canvas
        
        // Configure canvas view
        canvasView.isOpaque = false
        canvasView.backgroundColor = UIColor.clear
        canvasView.delegate = context.coordinator
        canvasView.becomeFirstResponder()
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = isDrawing ? ink : eraser
        canvasView.alwaysBounceVertical = true
        
        // Add background image
        if let image = UIImage(named: "Tree_5") {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let contentView = canvasView.subviews[0]
            contentView.addSubview(imageView)
            contentView.sendSubviewToBack(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1), // Mengatur lebar gambar menjadi 100% dari lebar contentView
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor) // Membuat gambar menjadi persegi panjang dengan tinggi yang sama dengan lebar
            ])
        }
        
        return canvasView
    }
    
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //update tool when main view update
        
        uiView.tool = isDrawing ? ink : eraser
    }
    class Coordinator: NSObject, PKCanvasViewDelegate {
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // Handle drawing changes if needed
        }
    }
    
    
}

//#Preview {
//    DrawingView()
//}
