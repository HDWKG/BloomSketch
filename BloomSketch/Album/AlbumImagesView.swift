//
//  AlbumImagesView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 28/05/24.
//

import SwiftUI
import PhotosUI

// Wrapper for UIImage that conforms to Identifiable
struct IdentifiableImage: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct AlbumImagesView: View {
    @StateObject private var viewModel = AlbumImagesViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: IdentifiableImage? = nil

    var body: some View {
        NavigationView {
            ScrollView {
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
            .navigationTitle("BloomSketch's Album")
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
                ImagePreviewView(image: identifiableImage.image)
            }
        }
    }
}


