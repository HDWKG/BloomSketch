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
        GeometryReader { geometry in
            if let tree = trees.first {
                NavigationStack {
                    ZStack {
                        Color(hex: 0xD5E4DD)
                            .ignoresSafeArea()
                        
                        ScrollView {
                            VStack(spacing: 16) {
                                Text("\(tree.name)'s Album")
                                    .font(.system(size: geometry.size.width * 0.07, weight: .bold))
                                    .foregroundColor(Color(hex: 0x1B3F2E))
                                
                                Text("Check out all of your creations!")
                                    .font(.system(size: geometry.size.width * 0.05))
                                    .foregroundColor(Color(hex: 0x1B3F2E))
                                
                                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 16) {
                                    ForEach(viewModel.images, id: \.asset) { imageTuple in
                                        Image(uiImage: imageTuple.image)
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: geometry.size.width * 0.5)
                                            .padding(4)
                                            .background(Color.white)
                                            .cornerRadius(8)
                                            .shadow(radius: 4)
                                            .onTapGesture {
                                                selectedImage = IdentifiableImage(image: imageTuple.image)
                                            }
                                    }
                                }
                                .padding(.horizontal, geometry.size.width * 0.05)
                            }
                            .padding(.top, geometry.size.height * 0.02)
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
                                                viewModel.images.append((image: image, asset: PHAsset()))
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
                                viewModel.removeImage(identifiableImage.image)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AlbumImagesView()
        .modelContainer(SwiftDataContainer.container)
}
