import Foundation
import SwiftData

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

@Model
final class Model: Codable {
    var types = [] as [EventType]
    var events = [] as [Event]

    init() {
        let vitamins = EventType(name: "💊 Витамины")
        let headache = EventType(name: "🤯 Мигрень")
        let iron = EventType(name: "💨 Утюг")
        let door = EventType(name: "🚪 Дверь")
        let fire = EventType(name: "🔥 Духовка")

        types = [
            vitamins,
            headache,
            iron,
            door,
            fire
        ]
        events = []
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        types = try container.decode([EventType].self, forKey: ._types)
        events = try container.decode([Event].self, forKey: ._events)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(types, forKey: ._types)
        try container.encode(events, forKey: ._events)
    }

    enum CodingKeys: String, CodingKey {
        case _types = "types"
        case _events = "events"
    }
}
