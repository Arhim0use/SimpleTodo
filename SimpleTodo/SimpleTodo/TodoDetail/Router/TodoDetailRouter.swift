//
//  TodoDetailRouter.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 06.02.2025.
//

import Foundation

protocol TodoDetailRouterProtocol: AnyObject {
    func navigateToTodoList()
//    func navigateToTodoDetail(with id: Int)
}

class TodoDetailRouter: TodoDetailRouterProtocol {
    weak var view: TodoDetailViewController?

    func navigateToTodoList() {
        view?.navigationController?.popViewController(animated: true)
        print("Hello world detail \(#function)")
    }
    
}
