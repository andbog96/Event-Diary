import Foundation
import Observation

struct EventType: Identifiable, Codable {
    let id: Int
    let name: String
}

struct Event: Identifiable, Codable {
    let id: Int
    let typeId: Int
    let date: Date
    let description: String
}

@Observable
final class Model {
    var types = [
        EventType(id: 1, name: "type name")
    ]
    var events = [
        Event(id: 1, typeId: 1, date: Date(), description: "qwewqe")
    ]

    func typeById(_ id: Int) -> EventType? {
        types.first(where: { $0.id == id })
    }
}
