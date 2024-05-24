import SwiftUI
import UserNotifications
struct ContentView1: View {
    var body: some View {
        VStack {
            Text("Page 1")
                .font(.largeTitle)
                .foregroundColor(.red)
            Spacer()
        }
        .task {
                        let center = UNUserNotificationCenter.current()
                        _ = try? await center.requestAuthorization(
                            options: [.alert, .sound, .badge]
                        )
                    }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            Text("Page 2")
                .font(.largeTitle)
                .foregroundColor(.green)
            Spacer()
        }
    }
}

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

    var body: some View {
        PagerManager(pageCount: 2, currentIndex: $currentIndex) {
            ContentView1()
            ContentView2()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
