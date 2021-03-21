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
        List {
            ForEach(self.todos){ todo in
                Text("\(todo.createAT))")
            }
        }
    }
    
    
}

struct TodosListView_Previews: PreviewProvider {
  static var previews: some View {
    TodosListView()
  }
}
