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
    var body: some View {
        PagerManager(pageCount: 3, currentIndex: $currentIndex) {
            StreakView()
                .modelContainer(SwiftDataContainer.container)
            TreeView()
                .modelContainer(SwiftDataContainer.container)
            CollectionView()
                .modelContainer(SwiftDataContainer.container)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
