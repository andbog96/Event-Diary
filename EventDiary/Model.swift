import Foundation
import Observation

struct EventType: Identifiable, Hashable, Codable {
    let name: String

    var id: Int {
        hashValue
    }
}

struct Event: Identifiable, Hashable, Codable {
    let type: EventType
    let date: Date
    let description: String

    var id: Int {
        hashValue
    }
}

@Observable
final class Model: Codable {
    var types = [] as [EventType]
    var events = [] as [Event]

    init() {
        let vitamins = EventType(name: "💊 Витамины")
        let headache = EventType(name: "🤯 Мигрень")
        let iron = EventType(name: "💨 Утюг")
        let door = EventType(name: "🚪 Дрерь")
        let fire = EventType(name: "🔥 Духовка")

        self.types = [
            vitamins,
            headache,
            iron,
            door,
            fire
        ]
        self.events = []
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
