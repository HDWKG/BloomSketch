import SwiftUI
import UserNotifications
struct ContentView3: View {
    var body: some View {
        VStack {
            Text("Page 3")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}
struct ContentView: View {
    @State private var currentIndex = 0
    @State private var streak = 34
    @State private var dailyDone = true
    var body: some View {
        PagerManager(pageCount: 2, currentIndex: $currentIndex) {
            StreakView(dailyDone: $dailyDone, streak: $streak)
            TreeView(streak: $streak)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
