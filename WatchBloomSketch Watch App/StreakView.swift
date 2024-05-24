import SwiftUI
import UserNotifications

struct StreakView: View {
    @Binding var dailyDone: Bool
    @Binding var streak: Int
    var body: some View {
        VStack {
            ZStack {
                if dailyDone {
                    Image("LeafON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                    Text("\(streak)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Image("LeafOff")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                    Text("\(streak)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
        .task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(
                options: [.alert, .sound, .badge]
            )
        }
    }
}

