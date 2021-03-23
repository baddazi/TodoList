//
//  TodosListView.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import Foundation
import SwiftUI

struct TodosListView: View{
    
    @State var todos: [Todo] = TodoJsonDecoder().getTodosFromJson()
    
    var body: some View{
        NavigationView {
            List {
                ForEach(self.todos) { todo in
                    Text("\(todo.createdAt))".prefix(20))
                }
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(trailing:
                                    Button(action: { addTodo() }) {
                                        Image(systemName: "plus.circle.fill")
                                    })
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    func addTodo(){
        self.todos.append(Todo(createdAt: Date()))
        TodoJsonEncoder().writeTodosToJson(todos:todos)
    }
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
        TodosListView()
    }
}
