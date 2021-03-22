//
//  TodosListView.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import Foundation
import SwiftUI

struct TodosListView: View{
    @State var todos: [Todo]=[Todo.sample, Todo.sample2]
    
    var body: some View{

        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(self.todos){ todo in
                        Text("\(todo.createAT))")
                    }
                }
                
                
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(trailing:
                                    Button(action: { self.todos.append(Todo(createAT: Date()))}) {
                                        Image(systemName: "plus.circle.fill") //(8)
                                            .resizable()
                                            .frame(width: 30, height: 30) // (11)
                                    })
            
        }
    }
    
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodosListView()
            
        }
    }
}
