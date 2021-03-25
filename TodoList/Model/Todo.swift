import Foundation

struct Todo: Identifiable, Codable {
    var createdAt: Date
    var id : Date {
        createdAt
    }
}

extension Todo {
    static var sample: Self = .init(createdAt:Date(timeIntervalSinceReferenceDate: 123456789.0))
    static var sample2: Self = .init(createdAt: Date(timeIntervalSinceReferenceDate: 123499999.0))
}

