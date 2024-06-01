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
                                        .onTapGesture {
                                            // Make it pop up like the details
                                        }
                                    Text(drawing.name)
                                        .padding(.bottom)
                                }
                            }
                            
                        }
                    }
                }                
            }
        }
    }
}

#Preview {
    CollectionView()
        .modelContainer(SwiftDataContainer.container)
}
