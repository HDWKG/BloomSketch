import SwiftUI
import UserNotifications
import SwiftData

struct StreakView: View {
    @Environment(\.modelContext) var modelContext
    @Query var trees: [Tree]
    
    var body: some View {
        if let tree = trees.first {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x63B256), Color(.white)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                
                VStack {
                    if tree.dailyDone {
                        ZStack {
                            Image("LeafON")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                            Text("\(tree.streak)")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                        }
                    } else {
                        ZStack {
                            Image("LeafOff")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                            Text("\(tree.streak)")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(Color(hex: 0x1B3F2E))
                        }
                    }
                }
            }
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
            .onAppear {
                tree.dailyDone = true
                tree.streak = 6
            }
        }
    }
}

