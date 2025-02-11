//
//  TodoDetailInteractor.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 06.02.2025.
//

import Foundation

protocol TodoDetailInteractorProtocol: AnyObject {
    func deleteTodo(withId todoId: Int)
    func editTodo(with todo: TodoModel) 
}

class TodoDetailInteractor {
    weak var presenter: TodoDetailPresenterProtocol?
    
}

extension TodoDetailInteractor: TodoDetailInteractorProtocol {
    func editTodo(with todo: TodoModel) {
        TodoCoreDataSource.shared.updateToDo(todoId: todo.id, toNext: todo)
    }
    
    func deleteTodo(withId todoId: Int) {
        TodoCoreDataSource.shared.deleteToDo(todoId: todoId)
    }
}
