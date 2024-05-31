//
//  ImagePreviewView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI

struct ImagePreviewView: View {
    let image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}
