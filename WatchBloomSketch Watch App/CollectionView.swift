//
//  CollectionView.swift
//  WatchBloomSketch Watch App
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query var drawings: [Drawing]
    
    var body: some View {
        let sortedDrawings = drawings.sorted { $0.name < $1.name }
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x63B256), Color(.white)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: [GridItem()]) {
                    ForEach(sortedDrawings) { drawing in
                        if drawing.drawnStatus {
                            VStack(alignment: .center) {
                                Image(drawing.filename)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 104, height: 104)
                                    .foregroundColor(.white)
                                    .background(.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                                
                                Text(drawing.name)
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: 0x1B3F2E))
                            }
                            .padding(.bottom, 8)

                        } else {
                            VStack(alignment: .center) {
                                ZStack {
                                    Image(drawing.filename)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 104, height: 104)
                                        .blur(radius: 4)
                                        .foregroundColor(.white)
                                        .background(.white)
                                        .cornerRadius(8)
                                        .shadow(radius: 4)
                                    
                                    Image(systemName: "lock")
                                        .resizable(resizingMode: .tile)
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.bottom, 8)
                            
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .onAppear {
            for _ in 1...5 {
                if let randomIndex = drawings.indices.randomElement() {
                    drawings[randomIndex].drawnStatus = true
                }
            }
        }
    }
}

