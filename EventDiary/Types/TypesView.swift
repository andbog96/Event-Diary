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
                    List {
                        ForEach(model.types) { type in
                            Text(type.name)
                        }
                        .onDelete { offsets in
                            withAnimation {
                                model.types.remove(atOffsets: offsets)
                            }
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
