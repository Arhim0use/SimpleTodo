//
//  TodoModelJSON.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//


struct TodosJSON: Codable {
    let todos: [TodoJSON]
    let total: Int
    let skip: Int
    let limit: Int
}

struct TodoJSON: Codable, Identifiable {
    let id: Int
    var todo: String
    var completed: Bool
    let userId: Int
}
