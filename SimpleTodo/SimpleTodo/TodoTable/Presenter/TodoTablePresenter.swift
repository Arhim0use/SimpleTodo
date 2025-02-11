//
//  TodoListPresenter.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 08.02.2025.
//

import Foundation

protocol TodoTablePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didLoad(todos: [TodoModel])
    func showDetail(for todo: TodoModel)
}

class TodoTablePresenter {
    weak var view: TodoTableViewControllerProtocol?
    var interactor: TodoTableInteractorProtocol?
    var router: TodoTableRouterProtocol?
    
}

extension TodoTablePresenter: TodoTablePresenterProtocol {
    func didLoad(todos: [TodoModel]) {
        view?.showTodos(todos)
    }
    
    func viewDidLoad() {
        interactor?.fetchTodos()
    }
    
    func showDetail(for todo: TodoModel) {
        router?.navigateToTodoDetail(todo)
    }
}
