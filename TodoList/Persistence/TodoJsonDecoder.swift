//
//  TodoJsonDecoder.swift
//  TodoList
//
//  Created by David Záruba on 23.03.2021.
//

import Foundation
struct TodoJsonDecoder{
    
    var fileName: String = "todos.json"
    
    func getTodosFromJson() ->[Todo]{
        var todos: [Todo] = []
        let jsonData = readJsonData()
        do{
            if (jsonData != nil){
                todos = try JSONDecoder().decode([Todo].self, from: (jsonData)!)
            }
        }
        catch{
            print(error)
        }
        return todos
    }
    
    func readJsonData()->Data?{
        do{
            let url = TodoJsonDecoder.getDocumentsDirectory().appendingPathComponent(fileName)
            return try Data(contentsOf: url)
        }
        catch{
            print(error)
        }
        return nil
    }
    
    static func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
