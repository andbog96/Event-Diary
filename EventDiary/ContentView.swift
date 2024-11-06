import SwiftUI

struct ContentView: View {
    @State var model = Model()

    var body: some View {
        TabView {
            EventListView(model: model)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("События")
                }
            EventTypesView(model: model)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Типы")
                }
        }

    }
}

#Preview {
    ContentView(model: Model())
}
