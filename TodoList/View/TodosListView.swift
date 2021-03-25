
import Foundation
import SwiftUI

struct TodosListView: View {
    @Environment(\.[key: \Disk.self]) private var disk
    @Environment(\.[key: \Throw.self]) private var `throw`
    
    @State var todos: [Todo] = []
    @State var displayedTodos: [Todo] = []
    @State var isCheckedThisWeek = false{
        didSet{
            filterTodos(searched: searchedText, isToggleOn: isCheckedThisWeek)
        }
    }
    @State var searchedText:String = ""{
        didSet{
            filterTodos(searched: searchedText, isToggleOn: isCheckedThisWeek)
        }
    }
    
    var body: some View {
        let bindBool = Binding<Bool>(
            get:{self.isCheckedThisWeek},
            set:{self.isCheckedThisWeek = $0}
        )
        let bindText = Binding<String>(
            get:{self.searchedText},
            set:{self.searchedText = $0}
        )
        
        NavigationView {
            List {
                Section(){
                    Toggle("Only this week", isOn: bindBool)
                    TextField("Search",text: bindText)
                }
                ForEach(self.displayedTodos) { todo in
                    Text("\(todo.name), " + "\(todo.createdAt))".prefix(20))
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
        .navigationViewStyle(StackNavigationViewStyle()) // used to fix Unable to simultaneously satisfy constraints.
        .onFirstAppear {
            `throw`.try {
                todos = try disk.loadTodos()
                displayedTodos=todos
                
            }
        }
    }
    
    func filterTodos(searched: String, isToggleOn: Bool){
        var tempTodos: [Todo] = todos
        if(!searched.isEmpty){
            tempTodos = tempTodos.filter{ todo in
                return todo.name.uppercased().contains(searched.uppercased()) }
        }
        if(isToggleOn){
            tempTodos = tempTodos.filter{ todo in
                return (Date().timeIntervalSinceReferenceDate - todo.createdAt.timeIntervalSinceReferenceDate) < 604800 } // 604800 is one week in sec.
        }
        displayedTodos=tempTodos
    }
    
    func createTodo(){
        self.todos.append(Todo(createdAt: Date(),name: "New Todo Name"))
        filterTodos(searched: searchedText, isToggleOn: isCheckedThisWeek)
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
