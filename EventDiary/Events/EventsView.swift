import SwiftUI
import SwiftData

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
                    List {
                        ForEach(model.events.reversed()) { event in
                            item(event: event)
                        }
                        .onDelete { offsets in
                            withAnimation {
                                model.events.remove(atOffsets: offsets)
                            }
                        }
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
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    EventsView(model: Model())
}
