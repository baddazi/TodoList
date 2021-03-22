//
//  Todo.swift
//  TodoList
//
//  Created by David Záruba on 21.03.2021.
//

import Foundation

struct Todo: Identifiable{
    var id: Date = Date()
    var createAT: Date
    
    

}

extension Todo{
    static var sample: Self = .init(createAT:Date(timeIntervalSinceReferenceDate: 123456789.0))
    static var sample2: Self = .init(createAT: Date(timeIntervalSinceReferenceDate: 123499999.0))
}

