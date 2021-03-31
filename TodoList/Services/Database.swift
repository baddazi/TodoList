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
        collection.addSnapshotListener( includeMetadataChanges: true ) { documentSnapshot, error in
          

            guard let document = documentSnapshot else {
                return
            }
           /* document.documentChanges.forEach{ diff in
                if(diff.type == .added){
                    todo = Todo.toTodo(data: diff.document.data())
                 //rint("data ?: " + String(diff.document.data()))
                }
                
            }*/
            let todos = document.documents.map{Todo.toTodo(data: $0.data())}
            todos.map{print($0.name)}
            
           // TodosListView().appendTodos(todo: todo!)
            callback(.success(todos))
        }
        
    }
}



