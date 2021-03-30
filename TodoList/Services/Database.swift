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
    
    
    var saveTodos: (Todo) throws -> Void = { todo in
        collection.addDocument(data: todo.toAnyObject())
    
    }
    
    //combine
    // var loadTodos: () -> AnyPublisher<[Todo], Error>  = ...
    var observeTodos: (@escaping (Result<[Todo], Error>) -> Void) -> Void = { callback in
        
      /*collection.addObserver(collection, forKeyPath: "todos", options: .new, context: <#T##UnsafeMutableRawPointer?#>)
       collection.addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutableRawPointer?#>)
        collection.observe(<#T##keyPath: KeyPath<CollectionReference, Value>##KeyPath<CollectionReference, Value>#>, options: <#T##NSKeyValueObservingOptions#>, changeHandler: <#T##(CollectionReference, NSKeyValueObservedChange<Value>) -> Void#>)*/
        
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



