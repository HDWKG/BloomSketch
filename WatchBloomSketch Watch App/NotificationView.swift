import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?

    var body: some View {
        VStack {
            Text(title ?? "Your Streak Is Ending")
                .font(.headline)
                .multilineTextAlignment(.center)

            Divider()

            Text(message ?? "Your streak is ending! Get to drawing so your streak doesn't end!")
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "Your Daily Streak Is Ending!", message: "Get to drawing! So you don't lose your streak!")
    }
}
