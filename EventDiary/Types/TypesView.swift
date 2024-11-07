import SwiftUI

struct TypesView: View {
    let model: Model

    @State private var showingAddTypeSheet = false

    var body: some View {
        NavigationStack {
            List(model.types) { type in
                Text(type.name)
            }
            .navigationTitle("Типы событий")
            .toolbar {
                Button {
                    showingAddTypeSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddTypeSheet) {
                AddTypeView(model: model, isPresented: $showingAddTypeSheet)
            }
        }
    }
}

#Preview {
    TypesView(model: Model())
}
