import Foundation

struct Todo: Identifiable, Codable {
    var createdAt: Date
    var id : Date {
        createdAt
    }
    var name: String
    func toAnyObject()-> [String:String]{
        return ["createdAt" : String(createdAt.timeIntervalSinceReferenceDate), "name" : name]
    }
    static func toTodo(data:[String:Any])-> Todo{

        return Todo(createdAt: Date(timeIntervalSinceReferenceDate: Double(data["createdAt"] as! Substring)!), name: (data["name"] as! String))
        
    }
    

}

extension Todo {
    static var sample: Self = .init(createdAt:Date(timeIntervalSinceReferenceDate: 123456789.0),name: "First")
    static var sample2: Self = .init(createdAt: Date(timeIntervalSinceReferenceDate: 123499999.0),name: "OtHER sAmPlE")
    static var sample3: Self = .init(createdAt: Date(timeIntervalSinceReferenceDate: 125555555.0),name: "12trick 333")
}

