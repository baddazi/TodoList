//
//  Databaswe.swift
//  TodoList
//
//  Created by David Záruba on 29.03.2021.
//

import Foundation
import Firebase
import SwiftUI


private var ref: DatabaseReference! = Database.database().reference(withPath: "todos")
private var collection = Firestore.firestore().collection("todos")

struct Database1: EnvironmentKey {
    static var defaultValue: Self = .init()
    
    
    var saveTodos: ([Todo]) throws -> Void = { todos in
        //todos.map{ref.child(String($0.createdAt.timeIntervalSinceReferenceDate)).setValue($0.toAnyObject())}
        todos.map{collection.addDocument(data: $0.toAnyObject())}
    }
    
    
    var loadTodos: () throws -> [Todo] = {
        var todos: [Todo] = []
        collection.getDocuments {(snapshots, err) in snapshots
            snapshots?.documents.map{todos.append(Todo.toTodo(data: $0.data())) }
            
        }
        
        
        return todos
    }
    
    var loadTodo: () -> Todo = {
        var todo: Todo = Todo.sample
        ref.observe(DataEventType.value, with: { (snapshot) in
            todo = Todo.toTodo(data: snapshot.value as! [String : Any])
        })
        return todo
    }
    
    
}
