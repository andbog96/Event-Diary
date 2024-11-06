import SwiftUI

struct EventTypesView: View {
    let model: Model

    var body: some View {
        NavigationView {
            List(model.types) { type in
                Text(type.name)
            }
            .navigationTitle("Типы событий")
        }

    }
}

#Preview {
    EventTypesView(model: Model())
}
