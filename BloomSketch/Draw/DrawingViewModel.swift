//
//  DrawingViewModel.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//
import SwiftUI
import PencilKit
import Photos

class DrawingViewModel: ObservableObject {
    @Published var canvas = PKCanvasView()
    @Published var isDrawing = true
    @Published var color: Color = .black
    @Published var pencilType: PKInkingTool.InkType = .pen
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var navigateBackToTreeHome = false

    func saveDrawing() {
        let drawingImage = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1.0)
        
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest.creationRequestForAsset(from: drawingImage)
            let albumTitle = "BloomSketch"
            if let album = self.fetchAlbum(named: albumTitle) {
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: album)
                albumChangeRequest?.addAssets([request.placeholderForCreatedAsset!] as NSArray)
            } else {
                let albumChangeRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumTitle)
                albumChangeRequest.addAssets([request.placeholderForCreatedAsset!] as NSArray)
            }
        }) { success, error in
            DispatchQueue.main.async {
                if success {
                    self.alertMessage = "Your drawing has been saved to the BloomSketch album."
                } else {
                    self.alertMessage = "Failed to save drawing: \(error?.localizedDescription ?? "unknown error")."
                }
                self.showAlert = true
                self.navigateBackToTreeHome = true
            }
        }
    }

    func fetchAlbum(named title: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", title)
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        return fetchResult.firstObject
    }

    func clearCanvas() {
        canvas.drawing = PKDrawing()
    }

//    func undoDrawing() {
//        undoManager?.undo()
//    }
//
//    func redoDrawing() {
//        undoManager?.redo()
//    }

    func toggleRuler() {
        canvas.isRulerActive.toggle()
    }
}
