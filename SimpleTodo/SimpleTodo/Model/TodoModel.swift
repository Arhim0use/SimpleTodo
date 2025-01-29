//
//  TodoModel.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import Foundation

struct TodoModel: Codable, Identifiable {
    let id: Int
    var title: String
    var description: String
    var completed: Bool
    let createdAt: Date
    let userId: Int
    
    init(id: Int,
         title: String = "",
         description: String = "",
         completed: Bool = false,
         createdAt: Date = Date(),
         userId: Int = 0)
    {
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
        self.createdAt = createdAt
        self.userId = userId
    }
}
