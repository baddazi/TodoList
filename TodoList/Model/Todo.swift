import Foundation

struct Todo: Identifiable, Codable {
    var createdAt: Date
    var id : Date {
        createdAt
    }
    
    func toAnyObject()-> [String:String]{
        return ["createdAt" : String(createdAt.timeIntervalSinceReferenceDate)]
    }
    
    static func toTodo(data:[String:Any])-> Todo{

       return Todo(createdAt: Date(timeIntervalSinceReferenceDate: Double(data["createdAt"] as! Substring)!))
        
    }
}

extension Todo {
    static var sample: Self = .init(createdAt:Date(timeIntervalSinceReferenceDate: 123456789.0))
    static var sample2: Self = .init(createdAt: Date(timeIntervalSinceReferenceDate: 123499999.0))
}

