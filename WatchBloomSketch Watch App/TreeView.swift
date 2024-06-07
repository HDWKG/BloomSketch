import Foundation
import SwiftUI
import SwiftData

struct TreeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    @State private var treeWidth: CGFloat = 160
    
    var body: some View {
        if let tree = trees.first {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x63B256), Color(.white)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Image(tree.treePhase)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: treeWidth, maxHeight: .infinity)
                }
            }
        }
    }
}
