import SwiftUI

struct AddEventView: View {
    let model: Model
    @Binding var isPresented: Bool

    @State private var selectedType: EventType
    @State private var date = Date.now
    @State private var description = ""

    init(model: Model, isPresented: Binding<Bool>) {
        self.model = model
        _isPresented = isPresented
        _selectedType = State(initialValue: model.types.first!)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Тип события")) {
                    Picker("", selection: $selectedType) {
                        ForEach(model.types) { type in
                            Text(type.name).tag(type)
                        }
                    }
                    .pickerStyle(.wheel)
                }

                Section(header: Text("Описание")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                }

                Section(header: Text("Время")) {
                    DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                }
            }
            .navigationTitle("Новое событие")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отменить") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Добавить") {
                        model.events.append(Event(type: selectedType, date: date, description: description))
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    AddEventView(model: Model(), isPresented: .constant(true))
}
