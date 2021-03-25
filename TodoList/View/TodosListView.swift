//
//  TodosListView.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import Foundation
import SwiftUI

struct TodosListView: View {
    @Environment(\.[key: \Disk.self]) private var disk
    @Environment(\.[key: \Throw.self]) private var `throw`
    
    @State var todos: [Todo] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos) { todo in
                    Text("\(todo.createdAt))".prefix(20))
                }
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(
                trailing:
                    Button(action: createTodo) {
                        Image(systemName: "plus.circle.fill")
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onFirstAppear {
            `throw`.try {
                todos = try disk.loadTodos()
            }
        }
    }
    
    func createTodo(){
        self.todos.append(Todo(createdAt: Date()))
        `throw`.try {
           try disk.saveTodos(todos)
        }
    }
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
        TodosListView()
    }
}
