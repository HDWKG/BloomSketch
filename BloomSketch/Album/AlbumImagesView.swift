//
//  AlbumImagesView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 28/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

// Wrapper for UIImage that conforms to Identifiable
struct IdentifiableImage: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct AlbumImagesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    @StateObject private var viewModel = AlbumImagesViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: IdentifiableImage? = nil
    
    var body: some View {
        if let tree = trees.first {
            NavigationView {
                ZStack {
                    
                    ScrollView {
                        Text("\(tree.name)'s Album")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        Text("Check out all of your creations!")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                            ForEach(viewModel.images, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .onTapGesture {
                                        selectedImage = IdentifiableImage(image: image)
                                    }
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            PhotosPicker(
                                selection: $selectedItem,
                                matching: .images,
                                photoLibrary: .shared()
                            ) {
                                Label("Select Photo", systemImage: "square.and.arrow.up.on.square")
                            }
                        }
                    }
                    .onChange(of: selectedItem) { newItem in
                        if let newItem = newItem {
                            newItem.loadTransferable(type: Data.self) { result in
                                switch result {
                                case .success(let data):
                                    if let data = data, let image = UIImage(data: data) {
                                        DispatchQueue.main.async {
                                            viewModel.images.append(image)
                                        }
                                    }
                                case .failure(let error):
                                    print("Error loading image: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                    .onAppear(perform: viewModel.loadImages)
                    .sheet(item: $selectedImage) { identifiableImage in
                        ImagePreviewView(image: identifiableImage.image) {
                            removeImage(identifiableImage.image)
                        }
                        
                    }
                }
            }
        }
    }
    func removeImage(_ image: UIImage) {
        if let index = viewModel.images.firstIndex(where: { $0 === image }) {
            viewModel.images.remove(at: index)
        }
    }
}


