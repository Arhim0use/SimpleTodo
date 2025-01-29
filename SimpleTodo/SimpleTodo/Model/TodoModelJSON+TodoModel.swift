//
//  TodoModelJSON+TodoModel.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import Foundation

extension TodoJSON {
    func toTodoModel() -> TodoModel {
        return TodoModel(
            id: self.id,
            title: self.todo, // Используем `todo` как `title`
            description: "", // Описание отсутствует в `TodoJSON`, поэтому оставляем пустым
            completed: self.completed,
            createdAt: Date(), // Дата создания не передается, задаем текущую дату
            userId: self.userId
        )
    }
}

extension TodoModel {
    func toTodoJSON() -> TodoJSON {
        return TodoJSON(
            id: self.id,
            todo: self.title,
            completed: self.completed,
            userId: self.userId
        )
    }
}
