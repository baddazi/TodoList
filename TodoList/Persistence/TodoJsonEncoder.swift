//
//  TodoJsonEncoder.swift
//  TodoList
//
//  Created by David Záruba on 23.03.2021.
//

import Foundation
struct TodoJsonEncoder {
    
    var fileName: String = "todos.json"
    
    func writeTodosToJson(todos: [Todo]){
        let url = TodoJsonDecoder.getDocumentsDirectory().appendingPathComponent(fileName)
        do{
            try JSONEncoder().encode(todos).write(to: url)
        }
        catch {
            print(error)
        }
    }
}
