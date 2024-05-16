import SwiftUI

struct ContentView: View {
    @State private var sproutName = ""
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
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
                    
                    Button(action: createSprout) {
                        Text("Start")
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
                
                Image("BottomBarLeaves_Crop")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    func createSprout() {
        // masukin ke controller sendiri kaaah
    }
}


#Preview {
    ContentView()
}

// Bekas Widget Streak Testing lama
//struct ContentView: View {
//    var body: some View {
//        let streak = 10
//
//        VStack {
//            GroupBox {
//                if streak > 7 {
//                    Text("Current Streak Is \(streak)!\nKeep Up The Good Work!")
//                } else {
//                    Text("Current Streak is \(streak)!\nLet's Get Brushing")
//                }
//            } label: {
//                Label("Streak", systemImage: "flame.fill")
//                    .foregroundColor(.red)
//            }
//            .frame(width: 350)
//            NavigationView {
//                NavigationLink(destination: NewSproutView()) {
//                    Image(systemName: "livephoto.play")
//                        .font(.system(size: 120))
//                        .foregroundColor(.red)
//                }
//            }
//            Spacer()
//        }
//    }
//}
