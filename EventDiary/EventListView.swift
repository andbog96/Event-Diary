import SwiftUI

struct EventListView: View {
    let model: Model

    var body: some View {
        NavigationView {
            List(model.events) { event in
                VStack(alignment: .leading) {
                    Text(model.typeById(event.typeId)?.name ?? "")
                        .font(.headline)
                    Text(event.description)
                        .font(.subheadline)
                    Text(dateFormatter.string(from: event.date))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Лента событий")
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
    EventListView(model: Model())
}
