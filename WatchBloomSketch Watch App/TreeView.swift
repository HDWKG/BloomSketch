import Foundation
import SwiftUI
struct TreeView: View {
    @State private var treePhase = ""
    @State private var treeWidth: CGFloat = 160
    @Binding var streak: Int
    
    var body: some View {
        VStack {
            ZStack {
                Color(hex: 0xD5E4DD)
                    .ignoresSafeArea()
                Image(treePhase)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        updateTreePhase()
                    }
                    .onChange(of: streak) { newValue in
                        updateTreePhase()
                    }
            }
        }
    }
    
    func updateTreePhase() {
        if streak < 5 {
            treePhase = "Tree_1"
        } else if streak < 15 {
            treePhase = "Tree_2"
        } else if streak < 30 {
            treePhase = "Tree_3"
        } else if streak < 50 {
            treePhase = "Tree_4"
        } else {
            treePhase = "Tree_5"
        }
    }
}
