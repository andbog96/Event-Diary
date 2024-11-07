import SwiftUI

struct ContentView: View {
    @State var model = Model()

    var body: some View {
        TabView {
            if !model.types.isEmpty {
                EventsView(model: model)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("События")
                    }
            }
            TypesView(model: model)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Типы")
                }
            SettingView(model: model)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Настройки")
                }
        }
        
    }
}

#Preview {
    ContentView(model: Model())
}
