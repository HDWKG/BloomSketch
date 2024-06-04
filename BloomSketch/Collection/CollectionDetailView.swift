//
//  CollectionDetailView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct CollectionDetailView: View {
    let drawing: Drawing
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss() // To dismiss the sheet
                }
                
                Spacer()
                
                Text(drawing.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: 0x1B3F2E))
                
                Spacer()
                
                if drawing.difficulty == "Easy" {
                    Text("\(drawing.difficulty)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.green)
                } else if drawing.difficulty == "Medium" {
                    Text("\(drawing.difficulty)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.orange)
                } else {
                    Text("\(drawing.difficulty)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.red)
                }
            }
            .padding(16)
            
            Spacer()
            
            Image(drawing.filename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: 0xD5E4DD))
                .edgesIgnoringSafeArea(.all)

        }
        .background(Color(hex: 0xD5E4DD))
    }
}


#Preview {
    CollectionDetailView(drawing: Drawing(name: "Flower", filename: "drawimage_1", drawnStatus: false, difficulty: "Hard"))
}
