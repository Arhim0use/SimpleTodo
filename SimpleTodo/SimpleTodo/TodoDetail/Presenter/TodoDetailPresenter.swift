//
//  TodoDetailPresenter.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 06.02.2025.
//

import Foundation

protocol TodoDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func deleteTodo(withId todoId: Int)
}

class TodoDetailPresenter {
    weak var view: TodoDetailViewControllerProtocol?
    var router: TodoDetailRouterProtocol?
    var interactor: TodoDetailInteractorProtocol?
    
}

extension TodoDetailPresenter: TodoDetailPresenterProtocol {
    func viewDidLoad() {
        view?.showTodo()
    }
    
    func deleteTodo(withId todoId: Int) {
        interactor?.deleteTodo(withId: todoId)
        router?.navigateToTodoList()
    }
}




