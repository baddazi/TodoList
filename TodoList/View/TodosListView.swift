
import Foundation
import SwiftUI

struct TodosListView: View {
    @Environment(\.[key: \Disk.self]) private var disk
    @Environment(\.[key: \Throw.self]) private var `throw`
    @Environment(\.[key: \Date.self]) private var currentDate
    
    @State var todos: [Todo] = []
    @State var displayedTodos: [Todo] = []
    @State var isThisWeekChecked = false {
        didSet {
            filterTodos()
        }
    }
    @State var searchedText: String = "" {
        didSet {
            filterTodos()
        }
    }
    
    var body: some View {
        let isThisWeekCheckedBinding = Binding<Bool>(
            get: {isThisWeekChecked},
            set: {isThisWeekChecked = $0}
        )
        let textBinding = Binding<String>(
            get: {searchedText},
            set: {searchedText = $0} 
        )
        
        NavigationView {
            List {
                Section() {
                    Toggle("Only this week", isOn: isThisWeekCheckedBinding)
                    TextField("Search",text: textBinding)
                }
                ForEach(self.displayedTodos) { todo in
                    Text("\(todo.name), " + "\(todo.createdAt))")
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
    
    func filterTodos() {
        displayedTodos = todos.filter { todo in (searchedText.isEmpty || todo.name.uppercased().contains(searchedText.uppercased())) && (!isThisWeekChecked || (currentDate().timeIntervalSinceReferenceDate - todo.createdAt.timeIntervalSinceReferenceDate) < 604800 )}
    }
   
    func createTodo() {
        
        self.todos.append(Todo(createdAt: Date(),name: "New Todo Name"))
        filterTodos()
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

extension Date: EnvironmentKey {
    public static var defaultValue: () -> Self = Date.init
    
}
