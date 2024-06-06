//
//  AlbumImagesViewModel.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import Photos

class AlbumImagesViewModel: ObservableObject {
    @Published var images: [(image: UIImage, asset: PHAsset)] = []
    private let imageManager = PHCachingImageManager()
    private var imageRequests: [PHImageRequestID] = []

    func loadImages() {
        images.removeAll()  // Reset album

        let albumTitle = "BloomSketch"
        if let album = fetchAlbum(named: albumTitle) {
            let assets = PHAsset.fetchAssets(in: album, options: nil)
            let targetSize = CGSize(width: 200, height: 200)
            
            // Configure batch loading
            var assetsBatch: [PHAsset] = []
            assets.enumerateObjects { asset, _, _ in
                assetsBatch.append(asset)
                if assetsBatch.count == 10 { // Adjust batch size as needed
                    self.loadImages(for: assetsBatch, targetSize: targetSize)
                    assetsBatch.removeAll()
                }
            }
            // Load any remaining assets
            if !assetsBatch.isEmpty {
                self.loadImages(for: assetsBatch, targetSize: targetSize)
            }
        }
    }

    private func loadImages(for assets: [PHAsset], targetSize: CGSize) {
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat
        options.resizeMode = .fast
        
        for asset in assets {
            let requestID = imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, _ in
                if let image = image {
                    DispatchQueue.main.async {
                        self.images.append((image: image, asset: asset))
                    }
                }
            }
            imageRequests.append(requestID)
        }
    }

    private func fetchAlbum(named title: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", title)
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        return fetchResult.firstObject
    }
    
    func removeImage(_ image: UIImage) {
        if let index = images.firstIndex(where: { $0.image === image }) {
            let asset = images[index].asset
            images.remove(at: index)
            
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }) { success, error in
                if let error = error {
                    print("Error deleting asset: \(error.localizedDescription)")
                } else if success {
                    print("Asset successfully deleted")
                }
            }
        }
    }
    
    deinit {
        // Cancel all image requests
        for requestID in imageRequests {
            imageManager.cancelImageRequest(requestID)
        }
    }
}
