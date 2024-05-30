import SwiftUI
import PencilKit

//struct Change: View {
//    @State var success = false
//    @State var action = 1
//    
//    var body: some View {
//        Group {
//            if success {
//                ContentView(action: action)
//            }
//        }
//    }
//}

struct NewSprout_View: View {
    @State private var sproutName = ""
    @State private var navigateToContentView = false
    @State private var navigateToAlbumView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Image("TopBarLeaves")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                    
                    Image("BloomSketch_LogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text("Name Your New Sprout")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .frame(height: 56)
                            
                            TextField("CutiePatotie", text: $sproutName)
                                .padding(.horizontal)
                        }
                        .frame(width: 300)
                        .padding(.top, 16)
                        NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                            EmptyView()
                        }
                        Button(action: { navigateToContentView = true }) {
                            Text("Start")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                        }
                        .padding(.top, 24)
                        
                        NavigationLink(destination: AlbumImagesView(), isActive: $navigateToAlbumView) {
                            EmptyView()
                        }
                        
                        Button(action: { navigateToAlbumView = true }) {
                            Text("Album")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                        }
                        .padding(.top, 24)
                    }
                    
                    Spacer()
                    
                    Image("BottomBarLeaves")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                }
            }
        }
    }
}

func createSprout() {
    // masukin ke controller sendiri kaaah
}

//#Preview {
//    @State var success = false
//    return NewSprout_View(success: $success)
//}
