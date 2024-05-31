import SwiftUI
import PencilKit
import Photos

struct CustomNavigationLink: View {
    @State private var canvas = PKCanvasView()
    @State private var isDrawing = true
    @State private var color: Color = .black
    @State private var pencilType: PKInkingTool.InkType = .crayon
    @Environment(\.undoManager) private var undoManager
    @State private var navigateBackToTreeHome = false

    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack{
            
            DrawingView(canvas: $canvas, isDrawing: $isDrawing, pencilType: $pencilType, color: $color)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            // Clear the canvas. Reset the drawing
                            canvas.drawing = PKDrawing()
                        } label: {
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
                        
                        Button {
                            // Erase tool
                            isDrawing = false
                        } label: {
                            Image(systemName: "eraser.line.dashed")
                        }
                        
                        Divider()
                            .rotationEffect(.degrees(90))
                        
                        // Menu for pencil types and color
                        Menu {
                            Button {
                                // Menu: Pencil
                                isDrawing = true
                                pencilType = .pencil
                            } label: {
                                Label("Pencil", systemImage: "pencil")
                            }
                            
                            Button {
                                // Menu: Pen
                                isDrawing = true
                                pencilType = .pen
                            } label: {
                                Label("Pen", systemImage: "applepencil")
                            }
                            
                            Button {
                                // Menu: Marker
                                isDrawing = true
                                pencilType = .marker
                            } label: {
                                Label("Marker", systemImage: "pencil.tip")
                            }
                            
                            Button {
                                // Menu: Monoline
                                isDrawing = true
                                pencilType = .monoline
                            } label: {
                                Label("Monoline", systemImage: "pencil.line")
                            }
                            
                            Button {
                                // Menu: Fountain Pen
                                isDrawing = true
                                pencilType = .fountainPen
                            } label: {
                                Label("Fountain", systemImage: "paintbrush.pointed.fill")
                            }
                            
                            Button {
                                // Menu: Watercolor
                                isDrawing = true
                                pencilType = .watercolor
                            } label: {
                                Label("Watercolor", systemImage: "paintbrush.pointed")
                            }
                            
                            Button {
                                // Menu: Crayon
                                isDrawing = true
                                pencilType = .crayon
                            } label: {
                                Label("Crayon", systemImage: "applepencil.and.scribble")
                            }
                            
                        } label: {
                            Image(systemName: "pencil.tip.crop.circle.fill")
                        }
                        
                        Spacer()
                        
                        Divider()
                            .rotationEffect(.degrees(90))
                        
                        ColorPicker("", selection: $color)
                        
                        
                        Button {
                            // Set ruler as active
                            canvas.isRulerActive.toggle()
                        } label: {
                            Image(systemName: "pencil.and.ruler.fill")
                        }
                        
                        Button {
                            saveDrawing()
                        } label: {
                            VStack {
                                Image(systemName: "square.and.arrow.down.on.square")
                                Text("Save")
                                    .font(.caption2)
                            }
                        }
                        
                        NavigationLink(destination: ContentView(), isActive: $navigateBackToTreeHome) {
                            EmptyView()
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Save Drawing"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            
        }
    }
    
    func saveDrawing() {
        let drawingImage = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1.0)
        
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest.creationRequestForAsset(from: drawingImage)
            let albumTitle = "BloomSketch"
            if let album = fetchAlbum(named: albumTitle) {
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: album)
                albumChangeRequest?.addAssets([request.placeholderForCreatedAsset!] as NSArray)
            } else {
                let albumChangeRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumTitle)
                albumChangeRequest.addAssets([request.placeholderForCreatedAsset!] as NSArray)
            }
        }) { success, error in
//            DispatchQueue.main.async {
//                if success {
//                    self.alertMessage = "Your drawing has been saved to the My Drawings album."
//                } else {
//                    self.alertMessage = "Failed to save drawing: \(error?.localizedDescription ?? "unknown error")."
//                }
//                self.showAlert = true
//            }
        }
        
        navigateBackToTreeHome = true
    }
    
    func fetchAlbum(named title: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", title)
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        return fetchResult.firstObject
    }
}
