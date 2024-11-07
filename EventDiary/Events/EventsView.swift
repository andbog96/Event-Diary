import SwiftUI

struct EventsView: View {
    let model: Model

    @State private var showingAddEventSheet = false

    var body: some View {
        NavigationStack {
            Group {
                if model.events.isEmpty {
                    ContentUnavailableView("Добавьте события", systemImage: "tray")
                        .padding()
                } else {
                    List(model.events.reversed()) { event in
                        item(event: event)
                    }
                }
            }
            .navigationTitle("Лента событий")
            .toolbar {
                Button {
                    showingAddEventSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddEventSheet) {
                AddEventView(model: model, isPresented: $showingAddEventSheet)
            }
        }
    }

    private func item(event: Event) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(event.type.name)
                    .font(.headline)
                Spacer()
                Text(dateFormatter.string(from: event.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            if !event.description.isEmpty {
                Text(event.description)
                    .font(.subheadline)
            }
        }
        .swipeActions {
            Button("Удалить") {
                model.events.removeAll(where: { $0 == event })
            }.tint(.red)
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    let vitamins = EventType(name: "💊 Витамины")
    let headache = EventType(name: "🤯 Мигрень")
    let iron = EventType(name: "💨 Утюг")
    let door = EventType(name: "🚪 Дрерь")
    let fire = EventType(name: "🔥 Духовка")

    let model = {
        let m = Model()
        m.types = [
            vitamins,
            headache,
            iron,
            door,
            fire
        ]
        m.events = [
            Event(type: vitamins, date: .now, description: ""),
            Event(type: headache, date: .now, description: "")
        ]
        return m
    }()
    EventsView(model: model)
}
