//
//  SplashScreenView.swift
//  Bloom Sketch
//
//  Created by MacBook Pro on 11/05/24.
//

import SwiftUI
import SwiftData

struct SplashScreen: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.white), Color(hex: 0x63B256)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            if isActive {
                if let tree = trees.first {
                    if tree.namedStatus {
                        ContentView()
                    } else {
                        OpeningView()
                    }
                }
            } else {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        
                        Image("BloomSketch_LogoWhite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 1, height: geometry.size.width * 0.6)
                            .foregroundColor(.red)
                        
                        Text("BloomSketch")
                            .font(Font.custom("Baskerville-Bold", size: geometry.size.width * 0.1))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        Spacer()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide back button
    }
}

#Preview {
    SplashScreen()
        .modelContainer(SwiftDataContainer.container)
}
