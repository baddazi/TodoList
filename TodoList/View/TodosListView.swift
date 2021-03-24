//
//  TodosListView.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import Foundation
import SwiftUI

struct TodosListView: View{
    
    @State var todos: [Todo] = [Todo.sample, Todo.sample2]
    
    var body: some View{
        NavigationView {
            List {
                ForEach(self.todos) { todo in
                    Text("\(todo.createdAt))")
                }
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(trailing:
                                    Button(action: { self.todos.append(Todo(createdAt: Date())) }) {
                                        Image(systemName: "plus.circle.fill")
                                    })
        }
    }
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
            TodosListView()
    }
}
