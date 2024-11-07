import SwiftUI

struct AddTypeView: View {
    let model: Model
    @Binding var isPresented: Bool

    @State private var name = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Название", text: $name)
            }
            .navigationTitle("Новый тип")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отменить") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Добавить") {
                        model.types.append(.init(id: UUID(), name: name))
                        isPresented = false
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddTypeView(model: Model(), isPresented: .constant(true))
}
