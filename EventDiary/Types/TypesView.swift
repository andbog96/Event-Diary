import SwiftUI

struct TypesView: View {
    let model: Model

    @State private var showingAddTypeSheet = false

    var body: some View {
        NavigationStack {
            Group {
                if model.types.isEmpty {
                    ContentUnavailableView("Добавьте типы событий", systemImage: "tray")
                        .padding()
                } else {
                    List(model.types) { type in
                        Text(type.name)
                            .swipeActions {
                                Button("Удалить") {
                                    model.types.removeAll(where: { $0 == type })
                                    model.events.removeAll(where: { $0.type == type })
                                }.tint(.red)
                            }
                    }
                }
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
