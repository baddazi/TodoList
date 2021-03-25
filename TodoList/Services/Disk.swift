import Foundation
import SwiftUI



struct Disk: EnvironmentKey {
    static var defaultValue: Self = .init()
    
    
    var loadTodos: () throws -> [Todo] = {
        try JSONDecoder().decode([Todo].self, from: Data(contentsOf: .todosFileURL))
    }
    
    var saveTodos: ([Todo]) throws -> Void = { todos in
        try JSONEncoder().encode(todos).write(to: .todosFileURL)
    }
}

extension URL {
    fileprivate static var todosFileURL: Self {
        documentsDirectory.appendingPathComponent("todos.json")
    }
    
    static var documentsDirectory: Self {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
