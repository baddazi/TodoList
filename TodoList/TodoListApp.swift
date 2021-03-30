//
//  TodoListApp.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import SwiftUI
import UIKit
import Firebase

@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            TodosListView()
        }
    }
}
