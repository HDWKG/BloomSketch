//
//  NewSprout_View.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI
struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                AlbumImagesView()
                    .modelContainer(SwiftDataContainer.container)
                    .tag(0)
                    .tabItem {
                        Label("Your Drawings", systemImage: "photo.on.rectangle.angled")
                    }
                
                TreeHomeView()
                    .modelContainer(SwiftDataContainer.container)
                    .tag(1)
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
                
                CollectionView()
                    .modelContainer(SwiftDataContainer.container)
                    .tag(2)
                    .tabItem {
                        Label("Collection", systemImage: "folder")
                    }
            }
            .padding(.top, 8)
            .gesture(DragGesture()
                .onEnded({ value in
                    if value.translation.width > 100 {
                        if self.selection > 0 {
                            self.selection -= 1
                        }
                    } else if value.translation.width < -100 {
                        if self.selection < 1 {
                            self.selection += 1
                        }
                    }
                })
            )
        }
        .navigationBarBackButtonHidden(true) // Hide back button
    }
}


#Preview {
    ContentView()
}
