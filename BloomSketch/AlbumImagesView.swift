//
//  AlbumImagesView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 28/05/24.
//

import SwiftUI
import Photos

struct AlbumImagesView: View {
    @State private var images: [UIImage] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
        }
        .onAppear(perform: loadImages)
    }
    
    func loadImages() {
        // Clear, no duplicate images
        images.removeAll()
        
        let albumTitle = "BloomSketch"
        if let album = fetchAlbum(named: albumTitle) {
            let assets = PHAsset.fetchAssets(in: album, options: nil)
            let imageManager = PHCachingImageManager()
            assets.enumerateObjects { asset, _, _ in
                let options = PHImageRequestOptions()
                options.isSynchronous = true
                imageManager.requestImage(for: asset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: options) { image, _ in
                    if let image = image {
                        self.images.append(image)
                    }
                }
            }
        }
    }
    
    func fetchAlbum(named title: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", title)
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        return fetchResult.firstObject
    }
}
