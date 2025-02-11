//
//  TodoListInteractor.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 08.02.2025.
//

import Foundation

protocol TodoTableInteractorProtocol: AnyObject {
    func fetchTodos()
    func getTodo(with id: Int)
}

class TodoTableInteractor {
    weak var presenter: TodoTablePresenterProtocol?
    private let userDefaults = UserDefaults.standard
}

extension TodoTableInteractor: TodoTableInteractorProtocol {
    func fetchTodos() {
        if !userDefaults.bool(forKey: "isFirstLaunch") {
            userDefaults.set(true, forKey: "isFirstLaunch")
            userDefaults.synchronize()
            
            fetchFromAPI()
        } else {
            fetchFromCoreData()
        }
    }
    
    private func fetchFromAPI() {
        TodoAPI.shared.fetchTodos { [weak self] result in
            switch result {
            case .success(let todos):
                print(self?.presenter.self ?? "presenter in interactor is nil")
                for todo in todos {
                    TodoCoreDataSource.shared.createToDo(todoEntity: todo)
                }
                self?.presenter?.didLoad(todos: todos)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func fetchFromCoreData() {
        switch TodoCoreDataSource.shared.getToDos() {
            case .success(let entitys):
            let todos: [TodoModel] = entitys.map { TodoModel.toTodoModel(from: $0) }
            self.presenter?.didLoad(todos: todos)
        case .failure(let error):
            print("Error: \(error)")
        }
    }
    
    func getTodo(with id: Int) {
        let result = TodoCoreDataSource.shared.getToDo(todoId: id)
        
        switch result {
        case .success(let entity):
            let todoModel = TodoModel.toTodoModel(from: entity)
        case .failure(let error):
            print("Error: \(error)")
        }
    }
    
}
