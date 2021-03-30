//
//  Databaswe.swift
//  TodoList
//
//  Created by David Záruba on 29.03.2021.
//

import Foundation
import Firebase
import SwiftUI

private var collection = Firestore.firestore().collection("todos")

struct Database1: EnvironmentKey {
    static var defaultValue: Self = .init()
    
    
    var saveTodos: ([Todo]) throws -> Void = { todos in
        //todos.map{ref.child(String($0.createdAt.timeIntervalSinceReferenceDate)).setValue($0.toAnyObject())}
        todos.map{collection.addDocument(data: $0.toAnyObject())}
    }
    
    //combine
    // var loadTodos: () -> AnyPublisher<[Todo], Error>  = ...
    var observeTodos: (@escaping (Result<[Todo], Error>) -> Void) -> Void = { callback in
      /* collection.getDocuments {
            (snapshots, err) in snapshots
            guard let todos = snapshots?.documents.map { Todo.toTodo(data: $0.data()) }
            else {
                //call me maybe
                return
            }
            callback(.success(todos!))
        }
        */
    
       
        //return todos
    }
    
    // ....currentDate().filter  { currentDate()
    //
    // Calendar.compare(date1: date2:, with granularity: .week)
    
    
    var loadTodo: () -> Todo = {
     /*   var todo: Todo = Todo.sample
        ref.observe(DataEventType.value) { (snapshot) in
            todo = Todo.toTodo(data: snapshot.value as! [String : Any])
        }
         */ return Todo.sample
    }
    
    
}



