import SwiftUI
import SwiftData

@main
struct EventDiaryApp: App {
    private let modelContainer: ModelContainer = {
        let schema = Schema([Model.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    private var model: Model {
        if let result = try! modelContainer.mainContext.fetch(FetchDescriptor<Model>()).first {
            return result
        } else {
            let model = Model()
            modelContainer.mainContext.insert(model)
            return model
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}
