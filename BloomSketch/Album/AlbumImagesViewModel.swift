//
//  AlbumImagesViewModel.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import Photos

class AlbumImagesViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    
    func loadImages() {
        let albumTitle = "BloomSketch"
        if let album = fetchAlbum(named: albumTitle) {
            let assets = PHAsset.fetchAssets(in: album, options: nil)
            let imageManager = PHCachingImageManager()
            assets.enumerateObjects { asset, _, _ in
                let options = PHImageRequestOptions()
                options.isSynchronous = true
                imageManager.requestImage(for: asset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: options) { image, _ in
                    if let image = image {
                        DispatchQueue.main.async {
                            self.images.append(image)
                        }
                    }
                }
            }
        }
    }
    private func fetchAlbum(named title: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", title)
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        return fetchResult.firstObject
    }
}
