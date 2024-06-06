//
//  DrawingView.swift
//  BloomSketch
//
//  Created by student on 16/05/24.
//

import SwiftUI
import SwiftData
import PencilKit

struct DrawingView: UIViewRepresentable {
  @Environment(\.modelContext) var modelContext
  @Query var drawings: [Drawing]

  @Binding var canvas: PKCanvasView
  @Binding var isDrawing: Bool
  @Binding var pencilType: PKInkingTool.InkType
  @Binding var color: Color

  var ink: PKInkingTool {
    PKInkingTool(pencilType, color: UIColor(color))
  }

  let eraser = PKEraserTool(.bitmap)

  func makeCoordinator() -> Coordinator {
    Coordinator()
  }

  func makeUIView(context: Context) -> PKCanvasView {
    canvas.configureCanvasView() // Move configuration logic to a separate method

    // Set the initial tool based on isDrawing
    canvas.tool = isDrawing ? ink : eraser

    // Randomly select a background image (if any) and update drawn status
    if let randomIndex = drawings.indices.randomElement(),
       let image = UIImage(named: drawings[randomIndex].filename) {
      drawings[randomIndex].drawnStatus = true
      addBackgroundImage(to: canvas, image: image)
    }

    return canvas
  }

  func updateUIView(_ uiView: PKCanvasView, context: Context) {
    uiView.tool = isDrawing ? ink : eraser // Update tool based on isDrawing
  }

  private func addBackgroundImage(to canvasView: PKCanvasView, image: UIImage) {
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false

    let contentView = canvasView.subviews[0]
    contentView.addSubview(imageView)
    contentView.sendSubviewToBack(imageView)

    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
    ])
  }

  class Coordinator: NSObject, PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
      // Handle drawing changes if needed
    }
  }
}

// Move configuration logic to a separate extension
private extension PKCanvasView {
  func configureCanvasView() {
    isOpaque = false
    backgroundColor = .clear
    delegate = nil // Set delegate in makeUIView
    becomeFirstResponder()
    drawingPolicy = .anyInput
    alwaysBounceVertical = true
  }
}
