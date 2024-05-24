import Foundation
import SwiftUI
struct TreeView: View {
    @State private var treePhase = ""
    @State private var treeWidth: CGFloat = 160
    @Binding var streak: Int
    
    var body: some View {
        VStack {
            ZStack {
                // Chatbox
                Image(treePhase)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
            treeWidth = 300
        } else if streak < 15 {
            treePhase = "Tree_2"
            treeWidth = 300
        } else if streak < 30 {
            treePhase = "Tree_3"
            treeWidth = 300
        } else if streak < 50 {
            treePhase = "Tree_4"
            treeWidth = 400
        } else {
            treePhase = "Tree_5"
            treeWidth = 420
        }
    }
}
