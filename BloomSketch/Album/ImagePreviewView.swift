//
//  ImagePreviewView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI

struct ImagePreviewView: View {
    let image: UIImage
    let onRemove: () -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss() // To dismiss the sheet
                }
                .padding(.leading, 16)
                .padding(.top, 8)
                
                Spacer()
                
                Button {
                  onRemove()
                  presentationMode.wrappedValue.dismiss()
                } label: {
                  Image(systemName: "trash")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                }
                .padding(.top, 16)
                .padding(.trailing, 16)

            }
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .edgesIgnoringSafeArea(.all)
            Spacer()
        }
    }
}

