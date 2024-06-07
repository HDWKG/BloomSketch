//
//  CollectionView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 01/06/24.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query var drawings: [Drawing]
    
    @State private var showDetailSheet = false
    @State private var selectedDrawing: Drawing?
    
    var body: some View {
        let sortedDrawings = drawings.sorted { $0.name < $1.name }
        
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color(hex: 0xD5E4DD)
                        .ignoresSafeArea()
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            Text("Collection")
                                .font(.system(size: geometry.size.width * 0.07, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .padding(.top, geometry.size.height * 0.02)
                            
                            Text("Draw more to unlock all drawings!")
                                .font(.system(size: geometry.size.width * 0.05))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                            
                            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 16) {
                                ForEach(sortedDrawings) { drawing in
                                    if drawing.drawnStatus {
                                        VStack(alignment: .center) {
                                            Spacer()
                                            
                                            Button(action: {
                                                showDetailSheet = true
                                                selectedDrawing = drawing
                                            }) {
                                                VStack {
                                                    Image(drawing.filename)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(height: geometry.size.width * 0.3)
                                                        .padding(4)
                                                    
                                                    Text(drawing.name)
                                                        .font(.system(size: geometry.size.width * 0.04))
                                                        .foregroundColor(Color(hex: 0x1B3F2E))
                                                }
                                            }
                                        }
                                        
                                    } else {
                                        VStack(alignment: .center) {
                                            ZStack {
                                                Image(drawing.filename)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: geometry.size.width * 0.3)
                                                    .padding(4)
                                                    .blur(radius: 20) // Adjust radius if needed
                                                
                                                Image(systemName: "lock")
                                                    .resizable(resizingMode: .tile)
                                                    .scaledToFit()
                                                    .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.08)
                                                    .foregroundColor(.black)
                                                    .offset(x: 0, y: 0)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, geometry.size.width * 0.05)
                            
                            Text("~ More to come! ~")
                                .font(.system(size: geometry.size.width * 0.05))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                                .padding(.vertical, geometry.size.height * 0.04)
                        }
                        .padding(.top, geometry.size.height * 0.02)
                    }
                }
            }
            .sheet(item: $selectedDrawing) { drawing in
                CollectionDetailView(drawing: drawing)
            }

        }
    }
}

#Preview {
    CollectionView()
        .modelContainer(SwiftDataContainer.container)
}
