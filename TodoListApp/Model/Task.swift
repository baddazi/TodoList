//
//  Task.swift
//  TODOListFirstApp
//
//  Created by David Záruba on 16.03.2021.
//

import Foundation

struct Task: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  //var priority: TaskPriority
  var completed: Bool
}

#if DEBUG
let testData = [
  Task(title: "Implement UI", completed: false),
  Task(title: "Connect to Firebase", completed: false),
  Task(title: "????", completed: false),
  Task(title: "PROFIT!!!", completed: false)
]
#endif
