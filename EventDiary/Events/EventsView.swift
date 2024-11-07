import SwiftUI

struct EventsView: View {
    let model: Model

    @State private var showingAddEventSheet = false

    var body: some View {
        NavigationStack {
            List(model.events.reversed()) { event in
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
