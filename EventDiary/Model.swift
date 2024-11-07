import Foundation
import Observation

struct EventType: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
}

struct Event: Identifiable, Codable {
    let id: UUID
    let type: EventType
    let date: Date
    let description: String
}

@Observable
final class Model: Codable {
    var types = [] as [EventType]
    var events = [] as [Event]

    init() {
        let type = EventType(id: UUID(), name: "type name")
        let type2 = EventType(id: UUID(), name: "type name 2")

        self.types = [type, type2]
        self.events = [
            Event(id: UUID(), type: type, date: Date(), description: "qwewqe\nqwewewqe")
        ]
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._types, forKey: ._types)
        try container.encode(self._events, forKey: ._events)
    }

    enum CodingKeys: String, CodingKey {
        case _types = "types"
        case _events = "events"
    }
}
