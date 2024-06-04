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
        VStack {
            Text("Collection")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(hex: 0x1B3F2E))
            Text("Draw more to unlock all drawings!")
                .font(.system(size: 20))
                .foregroundColor(Color(hex: 0x1B3F2E))
            
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(drawings) { drawing in
                            if drawing.drawnStatus {
                                
                                VStack(alignment: .center) {
                                    Spacer()
                                    Image(drawing.filename)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                    
                                    Button(action: {
                                        showDetailSheet = true
                                        selectedDrawing = drawing
                                    }) {
                                        Text(drawing.name)
                                    }
                                }
                                
                            } else {
                                VStack(alignment: .center) {
                                    ZStack {
                                        Image(drawing.filename)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .blur(radius: 10)
                                        
                                        Image(systemName: "lock")
                                            .resizable(resizingMode: .tile)
                                            .scaledToFit()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.black)
                                            .offset(x: 0, y: 0)
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
            }
            .sheet(isPresented: $showDetailSheet) {
                if let drawing = selectedDrawing {
                    CollectionDetailView(drawing: drawing)
                }
            }
        }
    }
}

#Preview {
    CollectionView()
        .modelContainer(SwiftDataContainer.container)
}
